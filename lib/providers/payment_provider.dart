// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:logger/logger.dart';
import 'package:mi_store/services/stripe_service.dart';

import '../utils/custom_dialog.dart';

class PaymentProvider extends ChangeNotifier{
StripeService service = StripeService();

  Future<void> getPayment(String totalAmount, BuildContext context) async{
   dynamic intent = await service.requestPaymentIntent(totalAmount);

   if(intent != null){
     await Stripe.instance.initPaymentSheet(
       paymentSheetParameters: SetupPaymentSheetParameters(
         paymentIntentClientSecret: intent['client_secret'],
         style: ThemeMode.light,
         merchantDisplayName: 'MI_STORE PAYMENT',
       )
     );

     await Stripe.instance.presentPaymentSheet().then((value){
        CustomDialog.show(context);
        Logger().w("Success - $totalAmount");
     }).onError((error, stackTrace){
        CustomDialog.dismiss(context);
        Logger().e("Error - $error");
     });
   }
  }
}