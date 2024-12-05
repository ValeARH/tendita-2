import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'item_detail_model.dart';
export 'item_detail_model.dart';

class ItemDetailWidget extends StatefulWidget {
  const ItemDetailWidget({
    super.key,
    this.itemParametro,
  });

  final ItemsRecord? itemParametro;

  @override
  State<ItemDetailWidget> createState() => _ItemDetailWidgetState();
}

class _ItemDetailWidgetState extends State<ItemDetailWidget> {
  late ItemDetailModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItemDetailModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CartRecord>>(
      stream: queryCartRecord(
        queryBuilder: (cartRecord) => cartRecord
            .where(
              'creator',
              isEqualTo: currentUserReference,
            )
            .where(
              'isActive',
              isEqualTo: true,
            ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<CartRecord> itemDetailCartRecordList = snapshot.data!;
        final itemDetailCartRecord = itemDetailCartRecordList.isNotEmpty
            ? itemDetailCartRecordList.first
            : null;

        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100.0),
            child: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              actions: [],
              flexibleSpace: FlexibleSpaceBar(
                title: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 0.0, 0.0),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30.0,
                            borderWidth: 1.0,
                            buttonSize: 50.0,
                            icon: Icon(
                              Icons.arrow_back_rounded,
                              color: Colors.white,
                              size: 30.0,
                            ),
                            onPressed: () async {
                              context.pop();
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              4.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Atras',
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                      child: Text(
                        widget!.itemParametro!.name,
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontSize: 22.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ],
                ),
                centerTitle: true,
                expandedTitleScale: 1.0,
              ),
              elevation: 2.0,
            ),
          ),
          body: SafeArea(
            top: true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.9,
                                height: 240.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFDBE2E7),
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          valueOrDefault<String>(
                                            widget!.itemParametro?.image,
                                            'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2940&q=80',
                                          ),
                                          width: double.infinity,
                                          height: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 4.0, 24.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 16.0, 24.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'DESCRIPCION',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Text(
                                formatNumber(
                                  widget!.itemParametro!.price,
                                  formatType: FormatType.decimal,
                                  decimalType: DecimalType.automatic,
                                  currency: '',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Poppins',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 4.0, 24.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 24.0),
                                  child: Text(
                                    widget!.itemParametro!.description,
                                    maxLines: 6,
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Poppins',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 160.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25.0),
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: Color(0xFF9E9E9E),
                              width: 1.0,
                            ),
                          ),
                          child: FlutterFlowCountController(
                            decrementIconBuilder: (enabled) => FaIcon(
                              FontAwesomeIcons.minus,
                              color: enabled
                                  ? Color(0xDD000000)
                                  : Color(0xFFEEEEEE),
                              size: 20.0,
                            ),
                            incrementIconBuilder: (enabled) => FaIcon(
                              FontAwesomeIcons.plus,
                              color: enabled
                                  ? FlutterFlowTheme.of(context).primary
                                  : Color(0xFFEEEEEE),
                              size: 20.0,
                            ),
                            countBuilder: (count) => Text(
                              count.toString(),
                              style: GoogleFonts.getFont(
                                'Roboto',
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 16.0,
                              ),
                            ),
                            count: _model.countControllerValue ??= 1,
                            updateCount: (count) => safeSetState(
                                () => _model.countControllerValue = count),
                            stepSize: 1,
                            minimum: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.9,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 18.0,
                          color: Color(0x33000000),
                          offset: Offset(
                            0.0,
                            5.0,
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    valueOrDefault<String>(
                                      formatNumber(
                                        functions.subtotalItem(
                                            _model.countControllerValue!,
                                            widget!.itemParametro!.price),
                                        formatType: FormatType.decimal,
                                        decimalType: DecimalType.automatic,
                                        currency: '',
                                      ),
                                      '\$0.00',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: Text(
                                  'subtotal',
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Poppins',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              if (loggedIn) {
                                if (itemDetailCartRecord != null) {
                                  var selectedItemsRecordReference1 =
                                      SelectedItemsRecord.collection.doc();
                                  await selectedItemsRecordReference1
                                      .set(createSelectedItemsRecordData(
                                    name: widget!.itemParametro?.name,
                                    item: widget!.itemParametro?.reference,
                                    description:
                                        widget!.itemParametro?.description,
                                    image: widget!.itemParametro?.image,
                                    price: widget!.itemParametro?.price,
                                    subTotal: valueOrDefault<double>(
                                      functions.subtotalItem(
                                          _model.countControllerValue!,
                                          widget!.itemParametro!.price),
                                      0.0,
                                    ),
                                    creator: currentUserReference,
                                    cantidad: _model.countControllerValue,
                                  ));
                                  _model.productoCreadoExits =
                                      SelectedItemsRecord.getDocumentFromData(
                                          createSelectedItemsRecordData(
                                            name: widget!.itemParametro?.name,
                                            item: widget!
                                                .itemParametro?.reference,
                                            description: widget!
                                                .itemParametro?.description,
                                            image: widget!.itemParametro?.image,
                                            price: widget!.itemParametro?.price,
                                            subTotal: valueOrDefault<double>(
                                              functions.subtotalItem(
                                                  _model.countControllerValue!,
                                                  widget!.itemParametro!.price),
                                              0.0,
                                            ),
                                            creator: currentUserReference,
                                            cantidad:
                                                _model.countControllerValue,
                                          ),
                                          selectedItemsRecordReference1);

                                  await itemDetailCartRecord!.reference.update({
                                    ...mapToFirestore(
                                      {
                                        'itemCount': FieldValue.increment(
                                            _model.countControllerValue!),
                                        'amount': FieldValue.increment(_model
                                            .productoCreadoExits!.subTotal),
                                        'selectedItems-List':
                                            FieldValue.arrayUnion([
                                          _model.productoCreadoExits?.reference
                                        ]),
                                      },
                                    ),
                                  });
                                } else {
                                  var selectedItemsRecordReference2 =
                                      SelectedItemsRecord.collection.doc();
                                  await selectedItemsRecordReference2
                                      .set(createSelectedItemsRecordData(
                                    name: widget!.itemParametro?.name,
                                    item: widget!.itemParametro?.reference,
                                    description:
                                        widget!.itemParametro?.description,
                                    image: widget!.itemParametro?.image,
                                    price: widget!.itemParametro?.price,
                                    subTotal: valueOrDefault<double>(
                                      functions.subtotalItem(
                                          _model.countControllerValue!,
                                          widget!.itemParametro!.price),
                                      0.0,
                                    ),
                                    creator: currentUserReference,
                                    cantidad: _model.countControllerValue,
                                  ));
                                  _model.productoCreado =
                                      SelectedItemsRecord.getDocumentFromData(
                                          createSelectedItemsRecordData(
                                            name: widget!.itemParametro?.name,
                                            item: widget!
                                                .itemParametro?.reference,
                                            description: widget!
                                                .itemParametro?.description,
                                            image: widget!.itemParametro?.image,
                                            price: widget!.itemParametro?.price,
                                            subTotal: valueOrDefault<double>(
                                              functions.subtotalItem(
                                                  _model.countControllerValue!,
                                                  widget!.itemParametro!.price),
                                              0.0,
                                            ),
                                            creator: currentUserReference,
                                            cantidad:
                                                _model.countControllerValue,
                                          ),
                                          selectedItemsRecordReference2);

                                  await CartRecord.collection.doc().set({
                                    ...createCartRecordData(
                                      creator: currentUserReference,
                                      itemCount: _model.countControllerValue,
                                      isActive: true,
                                      amount: valueOrDefault<double>(
                                        functions.subtotalItem(
                                            _model.countControllerValue!,
                                            widget!.itemParametro!.price),
                                        0.0,
                                      ),
                                    ),
                                    ...mapToFirestore(
                                      {
                                        'selectedItems-List': [
                                          _model.productoCreado?.reference
                                        ],
                                      },
                                    ),
                                  });
                                }

                                context.pop();
                              } else {
                                context.pushNamed('login');
                              }

                              safeSetState(() {});
                            },
                            text: loggedIn
                                ? 'Anadir a carrito'
                                : 'Iniciar Sesion',
                            options: FFButtonOptions(
                              width: 180.0,
                              height: 50.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: valueOrDefault<Color>(
                                !loggedIn
                                    ? Color(0xFFCE2626)
                                    : FlutterFlowTheme.of(context).primary,
                                FlutterFlowTheme.of(context).primary,
                              ),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
