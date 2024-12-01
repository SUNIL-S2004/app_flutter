import 'dart:convert';
import 'dart:io';
import 'package:demo_form/APIS/district_api.dart';
import 'package:demo_form/APIS/nationality_api.dart';
import 'package:demo_form/APIS/quarantine_api.dart';
import 'package:demo_form/APIS/reason_code_api.dart';
import 'package:demo_form/APIS/risk_api.dart';
import 'package:demo_form/APIS/submit_service_api.dart';
import 'package:demo_form/APIS/taluk_api.dart';
import 'package:demo_form/APIS/travel_history_api.dart';
import 'package:demo_form/APIS/village_api.dart';
import 'package:demo_form/Config/utility.dart';
import 'package:demo_form/Models/district_model.dart';
import 'package:demo_form/Models/nationality_model.dart';
import 'package:demo_form/Models/quarantine_model.dart';
import 'package:demo_form/Models/reason_code_model.dart';
import 'package:demo_form/Models/risk_model.dart';
import 'package:demo_form/Models/taluk_model.dart';
import 'package:demo_form/Models/travel_history_model.dart';
import 'package:demo_form/Models/village_model.dart';
import 'package:demo_form/custom_widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  String _selectedDate = 'Date of Positive confirmation';

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? d = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2050),
    );
    if (d != null) {
      setState(() {

        // var formatter = DateFormat('yyyy-MM-dd');
        _selectedDate = Utility.convertDateFormat(d.toString(), 'yyyy-MM-dd');
      });
    }
  }

  ImagePicker picker = ImagePicker();

  //Ticket No: 30
  List<XFile> photo = [];

  List<String> extensions = ['jpg', 'jpeg', 'png'];

  XFile? image;

  XFile? cameraImage;

  String index = '';

  List items = [];

  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController latitudeController = TextEditingController();
  TextEditingController longitudeController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController patientController = TextEditingController();
  TextEditingController remarkController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  var appbarColor = '';
  String snackFirstName = '';
  String snackLatitude = '';
  String snackLongitude = '';
  String snackMobile = '';
  String snackPatient = '';
  String snackNational = '';
  String snackRisk = '';
  String snackReason = '';
  String snackRemark = '';
  String snackAll = '';
  String age = '';
  String firstNameHint = 'Name';
  String ageHint = '';
  String radioLabel = '';
  String genderMale = '';
  String genderFemale = '';
  String save = '';

  String? gender;

  late List<District> districts = [];
  int selectedDistrict = 0;

  late List<Quarantine> quarantine = [];
  String selectedQuarantine = "00";

  late List<Nationality> nations = [];
  String selectedNation = "00";

  late List<TravelHistory> travels = [];
  String selectedTravels = "00";

  late List<RiskFactor> risks = [];
  String selectedRisks = "00";

  late List<ReasonCode> reasons = [];
  String selectedReasons = "00";

  late List<Taluk> taluks = [];
  int selectedTaluk = 0;

  late List<Village> village = [];
  int selectedVillage = 0;

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    initialize();
    super.initState();
  }

  void initialize() async {
    readJson();
    await getDistrictList().then((value) {
      if (mounted) {
        if (value != null) {
          setState(() {
            districts = value;
            districts.sort((a, b) {
              return a.districtNameEnglish
                  .toLowerCase()
                  .compareTo(b.districtNameEnglish.toLowerCase());
            });
          });
          districts.insert(
              0,
              District(
                districtCode: 0,
                districtNameEnglish: 'Select District',
              ));
        }
      }
    });
    await getVillageList().then((value) {
      if (mounted) {
        if (value != null) {
          setState(() {
            village = value;
          });
          village.insert(
              0,
              Village(
                  villageCode: 0,
                  villageNameEnglish: 'Select Village',
                  subDistrictCode: 0,
                  stateCode: 0,
                  census2011Code: '',
                  effectiveDate: '',
                  lastUpdated: '',
                  transactionId: 0));
        }
      }
    });
    await getQuarantineList().then((value) {
      if (mounted) {
        if (value != null) {
          setState(() {
            quarantine = value;
          });
          quarantine.insert(
              0,
              Quarantine(
                  quarantineCode: "00",
                  natureOfQuarantine: 'Select Quarantine Type',
                  natureOfQuarantTamil: null));
        }
      }
    });
    await getTravelList().then((value) {
      if (mounted) {
        if (value != null) {
          setState(() {
            travels = value;
          });
          travels.insert(
              0,
              TravelHistory(
                  travelHistoryCode: '00',
                  travelHistoryDescription: 'Select Corona Travel History',
                  travelHistoryDescriptionTamil: ''));
        }
      }
    });
    await getnationist().then((value) {
      if (mounted) {
        if (value != null) {
          setState(() {
            nations = value;
          });
          nations.insert(
              0,
              Nationality(
                  nationalityCode: '00',
                  country: 'Select Nation',
                  countryTamil: ''));
        }
      }
    });
    await getRiskFactorList().then((value) {
      if (mounted) {
        if (value != null) {
          setState(() {
            risks = value;
          });
          risks.insert(
              0,
              RiskFactor(
                  riskFactorCode: '00',
                  riskFactor: 'Select RiskFactor',
                  riskFactorTamil: ''));
        }
      }
    });
    await getReasonList().then((value) {
      if (mounted) {
        if (value != null) {
          setState(() {
            reasons = value;
          });
          reasons.insert(
              0, ReasonCode(reasonCode: '00', reasonByDesc: 'Select Reason'));
        }
      }
    });
  }

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/config.json');
    final data = await json.decode(response);
    setState(() {
      items = data["FormPage"];
      appbarColor = items[0]["Appbar_Color"];
      snackFirstName = items[0]["SnackBar_FirstName"];
      snackLatitude = items[0]["SnackBar_Latitude"];
      snackLongitude = items[0]["SnackBar_Longitude"];
      snackRemark = items[0]["SnackBar_remark"];
      snackAll = items[0]["SnackBar_All"];
      age = items[0]["Age"];
      firstNameHint = items[0]["TxtBox_FirstName_Hint"];
      ageHint = items[0]["TxtBox_Age_Hint"];
      radioLabel = items[0]["Radio_Gender"];
      genderMale = items[0]["Radio_Gender_Male"];
      genderFemale = items[0]["Radio_Gender_Female"];
      save = items[0]["TxtButton_Save"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Center(child: Text('Form')),
          backgroundColor: Colors.cyan,
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8, 8),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black45),
                  color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () async {
                        cameraImage =
                            await picker.pickImage(source: ImageSource.camera);
                        if (cameraImage != null) {
                          setState(() {
                            Image.file(
                              File(cameraImage!.path),
                              fit: BoxFit.cover,
                            );
                          });
                        }
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height / 3.9,
                        width: MediaQuery.of(context).size.width / 2,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black45)),
                        child: cameraImage != null
                            ? Image.file(
                                File(cameraImage!.path),
                                fit: BoxFit.cover,
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/image.png',
                                    cacheHeight: 80,
                                    cacheWidth: 80,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  const Text(
                                    "Upload Picture",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                      ),
                    ),
                  ),
                  TextFieldWidget(
                    text1: "Name",
                    Controller: firstnameController,
                    hint: 'Please Enter Name',
                    type: TextInputType.text,
                  ),
                  //dropdown starts..................
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          border: Border.all(color: Colors.black45)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<dynamic>(
                          isExpanded: true,
                          // Initial Value
                          value: selectedDistrict,
                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items:
                              districts.map<DropdownMenuItem<dynamic>>((item) {
                            return DropdownMenuItem(
                              value: item.districtCode,
                              child: Text(item.districtNameEnglish),
                            );
                          }).toList(),
                          onChanged: (newValue) async {
                            setState(() {
                              selectedDistrict = newValue;
                              selectedTaluk = 0;
                            });
                            await getTalukList(selectedDistrict.toString())
                                .then((value) {
                              if (value != null) {
                                setState(() {
                                  taluks = value;
                                  taluks.sort((a, b) {
                                    return a.blockNameEnglish
                                        .toLowerCase()
                                        .compareTo(
                                            b.blockNameEnglish.toLowerCase());
                                  });
                                });

                                taluks.insert(
                                    0,
                                    Taluk(
                                      blockCode: 0,
                                      blockNameEnglish: 'Select Taluk',
                                    ));
                              }
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          border: Border.all(color: Colors.black45)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<dynamic>(
                          isExpanded: true,
                          // Initial Value
                          value: selectedVillage,

                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items: village.map<DropdownMenuItem<dynamic>>((item) {
                            return DropdownMenuItem(
                              value: item.villageCode,
                              child: Text(item.villageNameEnglish),
                            );
                          }).toList(),
                          onChanged: (newValue) async {
                            setState(() {
                              selectedVillage = newValue;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  selectedDistrict == 0
                      ? Container()
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                                color: Colors.grey[100],
                                border: Border.all(color: Colors.black45)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<dynamic>(
                                isExpanded: true,
                                // Initial Value
                                value: selectedTaluk,

                                // Down Arrow Icon
                                icon: const Icon(Icons.keyboard_arrow_down),

                                // Array list of items
                                items: taluks
                                    .map<DropdownMenuItem<dynamic>>((item) {
                                  return DropdownMenuItem(
                                    value: item.blockCode,
                                    child: Text(item.blockNameEnglish),
                                  );
                                }).toList(),
                                onChanged: (newValue) async {
                                  setState(() {
                                    selectedTaluk = newValue;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                  //Nature of Quantity
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          border: Border.all(color: Colors.black45)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<dynamic>(
                          isExpanded: true,
                          // Initial Value
                          value: selectedQuarantine,
                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items:
                              quarantine.map<DropdownMenuItem<dynamic>>((item) {
                            return DropdownMenuItem(
                              value: item.quarantineCode,
                              child: Text(item.natureOfQuarantine),
                            );
                          }).toList(),
                          onChanged: (newValue) async {
                            setState(() {
                              selectedQuarantine = newValue;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          border: Border.all(color: Colors.black45)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<dynamic>(
                          isExpanded: true,
                          // Initial Value
                          value: selectedTravels,
                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items: travels.map<DropdownMenuItem<dynamic>>((item) {
                            return DropdownMenuItem(
                              value: item.travelHistoryCode,
                              child: Text(item.travelHistoryDescription),
                            );
                          }).toList(),
                          onChanged: (newValue) async {
                            setState(() {
                              selectedTravels = newValue;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  //dropdown finished.................
                  TextFieldWidget(
                    text1: "Latitude",
                    Controller: latitudeController,
                    hint: 'Please Enter Latitude',
                    type: TextInputType.number,
                  ),
                  //longitude
                  TextFieldWidget(
                    text1: "Longitude",
                    Controller: longitudeController,
                    hint: 'Please Enter Longitude',
                    type: TextInputType.number,
                  ),
                  //mobil;e no
                  TextFieldWidget(
                    text1: "Mobile No",
                    Controller: mobileController,
                    num: 10,
                    hint: 'Please Enter Mobile No',
                    type: TextInputType.number,
                  ),
                  //need to add photo
                  //patient id
                  TextFieldWidget(
                    text1: "Patient Id",
                    Controller: patientController,
                    hint: 'Please Enter Patient Id',
                    type: TextInputType.number,
                  ),
                  //nationality code
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          border: Border.all(color: Colors.black45)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<dynamic>(
                          isExpanded: true,
                          // Initial Value
                          value: selectedNation,
                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items: nations.map<DropdownMenuItem<dynamic>>((item) {
                            return DropdownMenuItem(
                              value: item.nationalityCode,
                              child: Text(item.country),
                            );
                          }).toList(),
                          onChanged: (newValue) async {
                            setState(() {
                              selectedNation = newValue;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  //risk factor
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          border: Border.all(color: Colors.black45)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<dynamic>(
                          isExpanded: true,
                          // Initial Value
                          value: selectedRisks,
                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items: risks.map<DropdownMenuItem<dynamic>>((item) {
                            return DropdownMenuItem(
                              value: item.riskFactorCode,
                              child: Text(item.riskFactor),
                            );
                          }).toList(),
                          onChanged: (newValue) async {
                            setState(() {
                              selectedRisks = newValue;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  //reason code
                  TextFieldWidget(
                    text1: "Remark",
                    Controller: remarkController,
                    hint: 'Please Enter Remark',
                    type: TextInputType.text,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          border: Border.all(color: Colors.black45)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<dynamic>(
                          isExpanded: true,
                          // Initial Value
                          value: selectedReasons,
                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items: reasons.map<DropdownMenuItem<dynamic>>((item) {
                            return DropdownMenuItem(
                              value: item.reasonCode,
                              child: Text(item.reasonByDesc),
                            );
                          }).toList(),
                          onChanged: (newValue) async {
                            setState(() {
                              selectedReasons = newValue;
                            });
                          },
                        ),
                      ),
                    ),
                  ),

                  TextFieldWidget(
                    text1: "Address",
                    Controller: addressController,
                    hint: 'Please Enter Address',
                    type: TextInputType.streetAddress,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 50,
                          width: 243,
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                              color: Colors.grey[100],
                              border: Border.all(color: Colors.black45)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              InkWell(
                                child: Text(_selectedDate,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: Color(0xFF000000))),
                                onTap: () {
                                  _selectDate(context);
                                },
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.calendar_today,
                                  color: Colors.blue,
                                ),
                                onPressed: () {
                                  _selectDate(context);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                          width: 115,
                          child: TextFieldWidget(
                            text1: "Age",
                            Controller: ageController,
                            hint: 'Please Enter Age',
                            type: TextInputType.number,
                          )),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 350,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Gender",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          RadioListTile(
                            title: const Text("Male"),
                            value: "male",
                            groupValue: gender,
                            onChanged: (value) {
                              setState(() {
                                gender = value.toString();
                                initialize();
                              });
                            },
                          ),
                          RadioListTile(
                            title: const Text("Female"),
                            value: "female",
                            groupValue: gender,
                            onChanged: (value) {
                              setState(() {
                                gender = value.toString();
                                initialize();
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        persistentFooterButtons: [
          Center(
            child: ElevatedButton(
                onPressed: () async {
                  firstnameController.text =
                      firstnameController.text.replaceAll(" ", '');
                  ageController.text = ageController.text.replaceAll(" ", '');
                  latitudeController.text =
                      latitudeController.text.replaceAll(" ", '');
                  longitudeController.text =
                      longitudeController.text.replaceAll(" ", '');
                  mobileController.text =
                      mobileController.text.replaceAll(" ", '');
                  patientController.text =
                      patientController.text.replaceAll(" ", '');
                  ageController.text = ageController.text.replaceAll("0", '');
                  if (formKey.currentState!.validate()) {
                    if (selectedDistrict != 0 ||
                        selectedRisks != "00" ||
                        selectedReasons != "00" ||
                        selectedNation != "00" ||
                        selectedVillage != 0 ||
                        selectedTaluk != 0 ||
                        selectedQuarantine != "00" ||
                        selectedTravels != "00" ||
                        _selectedDate != 'Select Date' ||
                        gender != null ||
                        cameraImage != null) {
                      await submit(
                              name: firstnameController.text,
                              district: selectedDistrict.toString(),
                              village: selectedVillage.toString(),
                              taluk: selectedTaluk.toString(),
                              quarantine: selectedQuarantine.toString(),
                              travel: selectedTravels.toString(),
                              latitude: latitudeController.text,
                              longitude: longitudeController.text,
                              mobile: mobileController.text,
                              patient: patientController.text,
                              nation: selectedNation,
                              date: _selectedDate,
                              age: ageController.text,
                              gender: gender!,
                              address: addressController.text,
                              remarks: remarkController.text,
                              photo: cameraImage!.path,
                              risk: selectedRisks,
                              reason_code: selectedReasons)
                          .then((value) {
                        if (value != null) {
                          snackBar('Submitted Successfully');
                          setState(() {
                            firstnameController.clear();
                            selectedDistrict = 0;
                            selectedVillage = 0;
                            selectedTaluk = 0;
                            selectedQuarantine = "00";
                            selectedTravels = "00";
                            latitudeController.clear();
                            longitudeController.clear();
                            mobileController.clear();
                            patientController.clear();
                            selectedNation = "00";
                            _selectedDate = 'Date of Positive confirmation';
                            ageController.clear();
                            gender = null;
                            addressController.clear();
                            remarkController.clear();
                            cameraImage = null;
                            selectedRisks = "00";
                            selectedReasons = "00";
                            initialize();
                          });
                        } else {
                          snackBar('Not Submitted');
                        }
                      });
                    } else {
                      snackBar('All fields are Mandatory*');
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.cyan,
                    //padding: EdgeInsets.all(10.0),
                    elevation: 5.0),
                child: const Text('Submit')),
          )
        ],
      ),
    );
  }

  snackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(milliseconds: 1000),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
