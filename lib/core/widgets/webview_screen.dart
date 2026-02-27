import 'package:webview_flutter/webview_flutter.dart';
import '../../views/payment/controller/payment_controller.dart';
import '../utils/basic_import.dart';
import 'confirmation_widget.dart';
import 'loading_widget.dart';

class WebPaymentScreen extends StatefulWidget {
  const WebPaymentScreen({super.key});

  @override
  State<WebPaymentScreen> createState() => _WebPaymentScreenState();
}

class _WebPaymentScreenState extends State<WebPaymentScreen> {
  final controller = Get.find<PaymentController>();
  late final WebViewController _webViewController;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeWebView();
  }

  void _initializeWebView() {
    final paymentUrl = controller.paymentUrl;

    if (paymentUrl.isEmpty) {
      _handleFailure("Payment URL not found");
      return;
    }

    debugPrint("🔗 Loading Payment URL: $paymentUrl");

    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            setState(() => isLoading = true);
          },
          onPageFinished: (String url) {
            setState(() => isLoading = false);
            debugPrint("✅ Current URL: $url");

            final uri = Uri.parse(url);

            // ✅ Paystack success
            final trxref = uri.queryParameters['trxref'];
            final reference = uri.queryParameters['reference'];
            if ((trxref != null || reference != null) &&
                (url.contains('callback') || url.contains('verify'))) {
              _handleSuccess();
              return;
            }

            // ✅ Stripe success
            final redirectStatus = uri.queryParameters['redirect_status'];
            final paymentIntent = uri.queryParameters['payment_intent'];
            if (paymentIntent != null && redirectStatus == 'succeeded') {
              _handleSuccess();
              return;
            }

            // ✅ Stripe failed
            if (paymentIntent != null && redirectStatus == 'failed') {
              _handleFailure("Payment failed");
              return;
            }

            // ✅ Paystack / Stripe cancel
            if (url.contains('cancel') || url.contains('close')) {
              _handleFailure("Payment was cancelled");
              return;
            }
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint("❌ WebView Error: ${error.description}");
            _handleFailure("Failed to load payment page");
          },
        ),
      )
      ..loadRequest(Uri.parse(paymentUrl));

    setState(() => isLoading = false);
  }

  void _handleSuccess() {
    if (!mounted) return;
    controller.paymentUrl = '';
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.offAll(
            () => ConfirmationWidget(
          iconPath: Assets.icons.vector,
          title: "Payment Successful",
          subtitle:
          'About this payment information has been sent to your email.\nWaiting for doctor confirmation.',
        ),
      );
    });
  }

  void _handleFailure(String message) {
    if (!mounted) return;
    controller.paymentUrl = '';
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.back();
      CustomSnackBar.error(message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: 'Payment',
        isBack: true,
      ),
      body: isLoading
          ? const LoadingWidget()
          : WebViewWidget(controller: _webViewController),
    );
  }
}