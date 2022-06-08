import 'dart:async';
import 'dart:io';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:xy2/modules/Post.dart';
import 'package:xy2/network/post_helper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:map_picker/map_picker.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter_svg/flutter_svg.dart';

class offeredit extends StatefulWidget {
  final PostsData post;
  offeredit(this.post);

  @override
  State<offeredit> createState() => _offereditState();
}

class _offereditState extends State<offeredit> {
  File? _file;
  ImagePicker _picker = ImagePicker();
  List<XFile> images = [];
  Future pickImage() async {
    final image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _file = File(image!.path);
    });
  }
  late bool done = false;
  late TextEditingController title;
  // late TextEditingController type;
  String? type;
  late TextEditingController description;
  // late TextEditingController location;
  String? location;
  late TextEditingController price;
  late TextEditingController space;
  late TextEditingController bedrooms;
  late TextEditingController bathrooms;
  late TextEditingController garages;

  @override
  void initState() {
    super.initState();
    title = new TextEditingController(text: widget.post.title);
    // type = new TextEditingController(text: widget.post.type.toString());
    String? type = widget.post.type.toString();
    description =
        new TextEditingController(text: widget.post.description.toString());
    // location = new TextEditingController(text: widget.post.location.toString());
    String? location = widget.post.location.toString();
    price = new TextEditingController(text: widget.post.price.toString());
    space = new TextEditingController(text: widget.post.space.toString());
    bedrooms = new TextEditingController(text: widget.post.bedrooms.toString());
    bathrooms =
        new TextEditingController(text: widget.post.bathrooms.toString());
    garages = new TextEditingController(text: widget.post.garages.toString());
  }

  final items = ['Sell', 'Rent'];
  final locations = [
    'ADRAR',
    'CHLEF',
    'LAGHOUAT',
    'OUM EL BOUAGHI',
    'BATNA',
    'BEJAIA',
    'BISKRA',
    'BECHAR',
    'BLIDA',
    'BOUIRA',
    'TAMANRASSET',
    'TEBESSA',
    'TLEMCEN',
    'TIARET',
    'TIZI-OUZOU',
    'ALGER',
    'DJELFA',
    'JIJEL',
    'SETIF',
    'SAIDA',
    'SKIKDA',
    'SIDI BEL-ABBES',
    'ANNABA',
    'GUELMA',
    'CONSTANTINE',
    'MEDEA',
    'MOSTAGANEM',
    'M’SILA',
    'MASCARA',
    'OUARGLA',
    'ORAN',
    'EL BAYADH',
    'ILLIZI',
    'B.B.ARRERIDJ',
    'BOUMERDES',
    'EL TARF',
    'TINDOUF',
    'TISSEMSILT',
    'EL-OUED',
    'KHENCHELA',
    'SOUK AHRAS',
    'TIPAZA',
    'MILA',
    'AIN-DEFLA',
    'NAAMA',
    'AIN TEMOUCHENT',
    'GHARDAIA',
    'RELIZANE',
    'TIMIMOUN',
    'BORDJ BADJI MOKHTAR',
    'OULED DJELLAL',
    'BENI ABBES ',
    'IN SALAH',
    'IN GUEZZAM',
    'TOUGGOURT',
    'DJANET',
    'El MGHAIR ',
    'MENIAA',
  ];

  final _controller = Completer<GoogleMapController>();
  MapPickerController mapPickerController = MapPickerController();

  CameraPosition cameraPosition = const CameraPosition(
    target: LatLng(36.351830, 6.611630),
    zoom: 14.4746,
  );

  var textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;

    editOffer() async {
      setState(() {
        isLoading = true;
      });
      if (title.text.isNotEmpty &&
          type.toString().isNotEmpty &&
          description.text.isNotEmpty &&
          location.toString().isNotEmpty &&
          price.text.isNotEmpty &&
          space.text.isNotEmpty &&
          bedrooms.text.isNotEmpty &&
          bathrooms.text.isNotEmpty &&
          garages.text.isNotEmpty &&
          cameraPosition.target.latitude.toString().isNotEmpty &&
          cameraPosition.target.longitude.toString().isNotEmpty &&
          images.isNotEmpty) {
        var response = await PostService().editoffer(
            widget.post.id,
            title.text,
            type!,
            description.text,
            location!,
            price.text,
            space.text,
            bedrooms.text,
            bathrooms.text,
            garages.text,
            cameraPosition.target.latitude,
            cameraPosition.target.longitude,
            images);
        if (response.statusCode == 200) {
          print(response);
          Navigator.pop(context);
        }
      } else {
        errorSnackBar(
            context, "fill all required fields and choose a location in map");
      }
      setState(() {
        isLoading = false;
      });
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Edit Offer'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: const [
              Color(0xFFe9b7ce),
              Color(0xFFffb88e),
              Color(0xFFabc9e9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: ListView(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  'Offer Informations :',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              buildInputForm('title', title, TextInputType.text, 1),
Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      hint: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Text(
                          'Type',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      value: type,
                      isExpanded: true,
                      items: items.map(buildMenuItem).toList(),
                      onChanged: (value) => setState(() {
                        this.type = value!;
                      }),
                    ),
                  ),
                ),
              ),              buildInputForm('description', description, TextInputType.text, 6),
              Row(
                children: [
                  Container(
                    width: 300,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Container(
                        height: 55,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            hint: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Text(
                                'Location',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            value: location,
                            isExpanded: true,
                            items: locations.map(buildMenuItem2).toList(),
                            onChanged: (value) {
                              location= value!;
                              setState(() {
                                this.location = value;
                                print(location);
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (done) {
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => pickMap()),
                        );
                      }
                      // pickMap();
                    },
                    icon: Icon(Icons.map_sharp),
                    color: Colors.white,
                  )
                ],
              ),
              buildInputForm('price', price, TextInputType.number, 1),
              buildInputForm('space', space, TextInputType.number, 1),
              buildInputForm('bedrooms', bedrooms, TextInputType.number, 1),
              buildInputForm('bathrooms', bathrooms, TextInputType.number, 1),
              buildInputForm('garages', garages, TextInputType.number, 1),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red[300],
                    shape: StadiumBorder(),
                  ),
                  onPressed: _pickImages,
                  child: Text('Upload images'),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Container(
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    children: List.generate(images.length, (index) {
                      File file = File(images[index].path);
                      return file == null
                          ? Text('No image is selected')
                          : Container(
                              padding: EdgeInsets.only(right: 15),
                              child: Stack(
                                children: [
                                  Image.file(file),
                                  Positioned(
                                    right: 5,
                                    top: 5,
                                    child: InkWell(
                                      child: Icon(
                                        Icons.remove_circle,
                                        size: 20,
                                        color: Colors.red,
                                      ),
                                      onTap: () {
                                        setState(() {
                                          images.removeAt(index);
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            );
                    }),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red[300],
                    shape: StadiumBorder(),
                  ),
                  onPressed: () {
                    editOffer();
                  },
                  child: Text('Create the offer'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _pickImages() async {
    List<XFile>? res = await _picker.pickMultiImage();
    setState(() {
      images.addAll(res!);
    });
  }

  Padding buildInputForm(String hint, TextEditingController value2,
      TextInputType inputtype, int maxLines) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
          controller: value2,
          // onChanged: (value) {
          //   value2.text = value;
          // },
          keyboardType: inputtype,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(12),
            ),
            hintText: hint,
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
          ),
          maxLines: maxLines,
          onEditingComplete: () => FocusScope.of(context).nextFocus(),
          validator: (value) {
            if (value!.isEmpty) {
              errorSnackBar(context, 'please write your $hint');
              // return ('please write your $hint');
            }
          }),
    );
  }

  errorSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.red,
      content: Text(text),
      duration: const Duration(seconds: 3),
    ));
  }

  Widget pickMap() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          MapPicker(
            iconWidget: SvgPicture.asset(
              "assets/images/location_icon.svg",
              height: 60,
            ),
            mapPickerController: mapPickerController,
            child: GoogleMap(
              myLocationEnabled: true,
              zoomControlsEnabled: false,
              myLocationButtonEnabled: false,
              mapType: MapType.normal,

              initialCameraPosition: cameraPosition,
              // onMapCreated: (GoogleMapController controller) {
              //   _controller.complete(controller);
              //       setState(() {
              //     done = true;
              //   });
              // },
              onCameraMoveStarted: () {
                mapPickerController.mapMoving!();
                textController.text = "checking ...";
              },
              onCameraMove: (cameraPosition) {
                this.cameraPosition = cameraPosition;
              },
              onCameraIdle: () async {
                mapPickerController.mapFinishedMoving!();
                List<Placemark> placemarks = await placemarkFromCoordinates(
                  cameraPosition.target.latitude,
                  cameraPosition.target.longitude,
                );
                textController.text =
                    '${placemarks.first.name}, ${placemarks.first.administrativeArea}, ${placemarks.first.country}';
              },
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).viewPadding.top + 20,
            width: MediaQuery.of(context).size.width - 50,
            height: 50,
            child: TextFormField(
              maxLines: 3,
              textAlign: TextAlign.center,
              readOnly: true,
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.zero, border: InputBorder.none),
              controller: textController,
            ),
          ),
          Positioned(
            bottom: 24,
            left: 24,
            right: 24,
            child: SizedBox(
              height: 50,
              child: TextButton(
                child: const Text(
                  "Submit",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    color: Color(0xFFFFFFFF),
                    fontSize: 19,
                    // height: 19/19,
                  ),
                ),
                onPressed: () {
                  print(
                      "Location ${cameraPosition.target.latitude} ${cameraPosition.target.longitude}");
                  print("Address: ${textController.text}");
                  Navigator.of(context).pop();
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xFFA3080C)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  
  DropdownMenuItem<String> buildMenuItem(String item) {
    return DropdownMenuItem(
      value: item,
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Text(
          item,
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem2(String item2) {
    return DropdownMenuItem(
      value: item2,
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Text(
          item2,
        ),
      ),
    );
  }
}
