import 'package:flutter/material.dart';
import 'package:flutter_samples/FITNESS_APP/common/colo_extension.dart';
import 'package:flutter_samples/MED_REMINDER/constants.dart';
import 'package:flutter_samples/MED_REMINDER/global_bloc.dart';
import 'package:flutter_samples/MED_REMINDER/models/medicine.dart';
import 'package:flutter_samples/MED_REMINDER/pages/medicine_details/medicine_details.dart';
import 'package:flutter_samples/MED_REMINDER/pages/new_entry/new_entry_page.dart';
import 'package:flutter_samples/samples/ui/rive_app/home.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

class MedHomePage extends StatelessWidget {
  const MedHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medication Reminder',
            style: TextStyle(
                fontSize: 24,
                fontFamily: 'Poppins',
                color: kPrimaryColor,
                fontWeight: FontWeight.w500)),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: () => Get.to(() => RiveAppHome())),
      ),
      body: Padding(
        padding: EdgeInsets.all(2.5.h),
        child: Column(
          children: [
            const TopContainer(),
            SizedBox(
              height: 2.h,
            ),
            //the widget take space as per need
            const Flexible(
              child: BottomContainer(),
            ),
            10.heightBox
          ],
        ),
      ),
      floatingActionButton: InkResponse(
        onTap: () {
          // go to new entry page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NewEntryPage(),
            ),
          );
        },
        child: SizedBox(
          width: 9.h,
          height: 9.h,
          child: Card(
            color: kPrimaryColor,
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(3.h),
            ),
            child: Icon(
              Icons.add_outlined,
              color: kScaffoldColor,
              size: 50.sp,
            ),
          ),
        ),
      ),
    );
  }
}

class TopContainer extends StatelessWidget {
  const TopContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalBloc globalBloc = Provider.of<GlobalBloc>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 1.h,
        ),
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.2,
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Worry less',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  Text(
                    'Live healthier.',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  20.heightBox,
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: Text(
                      'Get notified when it\'s time for your medication.',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        fontFamily: 'Inter',
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Image.asset('assets/images/med_rem.png')
            ],
          ),
        ),
        //lets show number of saved medicines from shared preferences
        // StreamBuilder<List<Medicine>>(
        //     stream: globalBloc.medicineList$,
        //     builder: (context, snapshot) {
        //       return Container(
        //         alignment: Alignment.center,
        //         padding: EdgeInsets.only(bottom: 1.h),
        //         child: Text(
        //           !snapshot.hasData ? '0' : snapshot.data!.length.toString(),
        //           style: Theme.of(context).textTheme.headline4,
        //         ),
        //       );
        //     }),
      ],
    );
  }
}

class BottomContainer extends StatelessWidget {
  const BottomContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //later we will use condition to show the save data
    // return Center(
    //   child: Text(
    //     'No Medicine',
    //     textAlign: TextAlign.center,
    //     style: Theme.of(context).textTheme.headline3,
    //   ),

    final GlobalBloc globalBloc = Provider.of<GlobalBloc>(context);

    return StreamBuilder(
      stream: globalBloc.medicineList$,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          //if no data is saved
          return Container();
        } else if (snapshot.data!.isEmpty) {
          return Center(
            child: Text(
              'No Medicine',
              style: Theme.of(context).textTheme.headline3,
            ),
          );
        } else {
          return GridView.builder(
            padding: EdgeInsets.only(top: 1.h, bottom: 1.h),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
            ),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return MedicineCard(medicine: snapshot.data![index]);
            },
          );
        }
      },
    );
  }
}

class MedicineCard extends StatelessWidget {
  const MedicineCard({Key? key, required this.medicine}) : super(key: key);
  final Medicine medicine;
  //for getting the current details of the saved items

  //first we need to get the medicine type icon
  //lets make a function

  Hero makeIcon(double size) {
    //here is the bug, the capital word of the first letter
    //lets fix
    if (medicine.medicineType == 'Bottle') {
      return Hero(
        tag: medicine.medicineName! + medicine.medicineType!,
        child: SvgPicture.asset(
          'assets/icons/bottle.svg',
          color: kOtherColor,
          height: 7.h,
        ),
      );
    } else if (medicine.medicineType == 'Pill') {
      return Hero(
        tag: medicine.medicineName! + medicine.medicineType!,
        child: SvgPicture.asset(
          'assets/icons/pill.svg',
          color: kOtherColor,
          height: 7.h,
        ),
      );
    } else if (medicine.medicineType == 'Syringe') {
      return Hero(
        tag: medicine.medicineName! + medicine.medicineType!,
        child: SvgPicture.asset(
          'assets/icons/syringe.svg',
          color: kOtherColor,
          height: 7.h,
        ),
      );
    } else if (medicine.medicineType == 'Tablet') {
      return Hero(
        tag: medicine.medicineName! + medicine.medicineType!,
        child: SvgPicture.asset(
          'assets/icons/tablet.svg',
          color: kOtherColor,
          height: 7.h,
        ),
      );
    }
    //in case of no medicine type icon selection
    return Hero(
      tag: medicine.medicineName! + medicine.medicineType!,
      child: Icon(
        Icons.error,
        color: kOtherColor,
        size: size,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      splashColor: Colors.grey,
      onTap: () {
        //go to details activity with animation, later

        Navigator.of(context).push(
          PageRouteBuilder<void>(
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return AnimatedBuilder(
                animation: animation,
                builder: (context, Widget? child) {
                  return Opacity(
                    opacity: animation.value,
                    child: MedicineDetails(medicine),
                  );
                },
              );
            },
            transitionDuration: const Duration(milliseconds: 500),
          ),
        );
      },
      child: Material(
        borderRadius: BorderRadius.circular(15),
        elevation: 6,
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 1.h, bottom: 20),
          // margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
            // color: Colors.grey[200],
            gradient: LinearGradient(colors: [
              TColor.primaryColor2.withOpacity(.7),
              TColor.primaryColor1.withOpacity(.7),
            ]),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              //call the function here icon type
              //later we will the icon issue
              makeIcon(7.h),
              const Spacer(),
              //hero tag animation, later
              Hero(
                tag: medicine.medicineName!,
                child: Text(
                  medicine.medicineName!,
                  overflow: TextOverflow.fade,
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              SizedBox(
                height: 0.3.h,
              ),
              //time interval data with condition, later
              Text(
                medicine.interval == 1
                    ? "Every ${medicine.interval} hour"
                    : "Every ${medicine.interval} hour",
                overflow: TextOverflow.fade,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.caption,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
