if Rails.env.development?
  STRIPE_API_KEY = "sk_test_bYgdtk0IOUfFDae7vQeDtb6E "
  STRIPE_PUBLIC_KEY = "pk_test_bE01q4co4aEbSewnVLz7ggvn "
else
  STRIPE_API_KEY = "sk_live_dDJpRefPV5Ds6v9ieIwhL33x "
  STRIPE_PUBLIC_KEY = "pk_live_OxhJlBSVrQYs20fxFiHe1mrR "
end