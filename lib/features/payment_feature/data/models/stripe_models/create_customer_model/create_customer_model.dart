class CreateCustomerModel {
  CreateCustomerModel({
      String? id, 
      String? object, 
      dynamic address, 
      num? balance, 
      num? created, 
      String? currency, 
      dynamic defaultSource, 
      bool? delinquent, 
      String? description, 
      dynamic discount, 
      dynamic email, 
      String? invoicePrefix, 
      InvoiceSettings? invoiceSettings, 
      bool? livemode, 
      dynamic metadata, 
      dynamic name, 
      num? nextInvoiceSequence, 
      dynamic phone, 
      List<dynamic>? preferredLocales, 
      dynamic shipping, 
      String? taxExempt, 
      dynamic testClock,}){
    _id = id;
    _object = object;
    _address = address;
    _balance = balance;
    _created = created;
    _currency = currency;
    _defaultSource = defaultSource;
    _delinquent = delinquent;
    _description = description;
    _discount = discount;
    _email = email;
    _invoicePrefix = invoicePrefix;
    _invoiceSettings = invoiceSettings;
    _livemode = livemode;
    _metadata = metadata;
    _name = name;
    _nextInvoiceSequence = nextInvoiceSequence;
    _phone = phone;
    _preferredLocales = preferredLocales;
    _shipping = shipping;
    _taxExempt = taxExempt;
    _testClock = testClock;
}

  CreateCustomerModel.fromJson(dynamic json) {
    _id = json['id'];
    _object = json['object'];
    _address = json['address'];
    _balance = json['balance'];
    _created = json['created'];
    _currency = json['currency'];
    _defaultSource = json['default_source'];
    _delinquent = json['delinquent'];
    _description = json['description'];
    _discount = json['discount'];
    _email = json['email'];
    _invoicePrefix = json['invoice_prefix'];
    _invoiceSettings = json['invoice_settings'] != null ? InvoiceSettings.fromJson(json['invoice_settings']) : null;
    _livemode = json['livemode'];
    _metadata = json['metadata'];
    _name = json['name'];
    _nextInvoiceSequence = json['next_invoice_sequence'];
    _phone = json['phone'];
    if (json['preferred_locales'] != null) {
      _preferredLocales = [];
    }
    _shipping = json['shipping'];
    _taxExempt = json['tax_exempt'];
    _testClock = json['test_clock'];
  }
  String? _id;
  String? _object;
  dynamic _address;
  num? _balance;
  num? _created;
  String? _currency;
  dynamic _defaultSource;
  bool? _delinquent;
  String? _description;
  dynamic _discount;
  dynamic _email;
  String? _invoicePrefix;
  InvoiceSettings? _invoiceSettings;
  bool? _livemode;
  dynamic _metadata;
  dynamic _name;
  num? _nextInvoiceSequence;
  dynamic _phone;
  List<dynamic>? _preferredLocales;
  dynamic _shipping;
  String? _taxExempt;
  dynamic _testClock;
CreateCustomerModel copyWith({  String? id,
  String? object,
  dynamic address,
  num? balance,
  num? created,
  String? currency,
  dynamic defaultSource,
  bool? delinquent,
  String? description,
  dynamic discount,
  dynamic email,
  String? invoicePrefix,
  InvoiceSettings? invoiceSettings,
  bool? livemode,
  dynamic metadata,
  dynamic name,
  num? nextInvoiceSequence,
  dynamic phone,
  List<dynamic>? preferredLocales,
  dynamic shipping,
  String? taxExempt,
  dynamic testClock,
}) => CreateCustomerModel(  id: id ?? _id,
  object: object ?? _object,
  address: address ?? _address,
  balance: balance ?? _balance,
  created: created ?? _created,
  currency: currency ?? _currency,
  defaultSource: defaultSource ?? _defaultSource,
  delinquent: delinquent ?? _delinquent,
  description: description ?? _description,
  discount: discount ?? _discount,
  email: email ?? _email,
  invoicePrefix: invoicePrefix ?? _invoicePrefix,
  invoiceSettings: invoiceSettings ?? _invoiceSettings,
  livemode: livemode ?? _livemode,
  metadata: metadata ?? _metadata,
  name: name ?? _name,
  nextInvoiceSequence: nextInvoiceSequence ?? _nextInvoiceSequence,
  phone: phone ?? _phone,
  preferredLocales: preferredLocales ?? _preferredLocales,
  shipping: shipping ?? _shipping,
  taxExempt: taxExempt ?? _taxExempt,
  testClock: testClock ?? _testClock,
);
  String? get id => _id;
  String? get object => _object;
  dynamic get address => _address;
  num? get balance => _balance;
  num? get created => _created;
  String? get currency => _currency;
  dynamic get defaultSource => _defaultSource;
  bool? get delinquent => _delinquent;
  String? get description => _description;
  dynamic get discount => _discount;
  dynamic get email => _email;
  String? get invoicePrefix => _invoicePrefix;
  InvoiceSettings? get invoiceSettings => _invoiceSettings;
  bool? get livemode => _livemode;
  dynamic get metadata => _metadata;
  dynamic get name => _name;
  num? get nextInvoiceSequence => _nextInvoiceSequence;
  dynamic get phone => _phone;
  List<dynamic>? get preferredLocales => _preferredLocales;
  dynamic get shipping => _shipping;
  String? get taxExempt => _taxExempt;
  dynamic get testClock => _testClock;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['object'] = _object;
    map['address'] = _address;
    map['balance'] = _balance;
    map['created'] = _created;
    map['currency'] = _currency;
    map['default_source'] = _defaultSource;
    map['delinquent'] = _delinquent;
    map['description'] = _description;
    map['discount'] = _discount;
    map['email'] = _email;
    map['invoice_prefix'] = _invoicePrefix;
    if (_invoiceSettings != null) {
      map['invoice_settings'] = _invoiceSettings?.toJson();
    }
    map['livemode'] = _livemode;
    map['metadata'] = _metadata;
    map['name'] = _name;
    map['next_invoice_sequence'] = _nextInvoiceSequence;
    map['phone'] = _phone;
    if (_preferredLocales != null) {
      map['preferred_locales'] = _preferredLocales?.map((v) => v.toJson()).toList();
    }
    map['shipping'] = _shipping;
    map['tax_exempt'] = _taxExempt;
    map['test_clock'] = _testClock;
    return map;
  }

}

/// custom_fields : null
/// default_payment_method : null
/// footer : null
/// rendering_options : null

class InvoiceSettings {
  InvoiceSettings({
      dynamic customFields, 
      dynamic defaultPaymentMethod, 
      dynamic footer, 
      dynamic renderingOptions,}){
    _customFields = customFields;
    _defaultPaymentMethod = defaultPaymentMethod;
    _footer = footer;
    _renderingOptions = renderingOptions;
}

  InvoiceSettings.fromJson(dynamic json) {
    _customFields = json['custom_fields'];
    _defaultPaymentMethod = json['default_payment_method'];
    _footer = json['footer'];
    _renderingOptions = json['rendering_options'];
  }
  dynamic _customFields;
  dynamic _defaultPaymentMethod;
  dynamic _footer;
  dynamic _renderingOptions;
InvoiceSettings copyWith({  dynamic customFields,
  dynamic defaultPaymentMethod,
  dynamic footer,
  dynamic renderingOptions,
}) => InvoiceSettings(  customFields: customFields ?? _customFields,
  defaultPaymentMethod: defaultPaymentMethod ?? _defaultPaymentMethod,
  footer: footer ?? _footer,
  renderingOptions: renderingOptions ?? _renderingOptions,
);
  dynamic get customFields => _customFields;
  dynamic get defaultPaymentMethod => _defaultPaymentMethod;
  dynamic get footer => _footer;
  dynamic get renderingOptions => _renderingOptions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['custom_fields'] = _customFields;
    map['default_payment_method'] = _defaultPaymentMethod;
    map['footer'] = _footer;
    map['rendering_options'] = _renderingOptions;
    return map;
  }

}