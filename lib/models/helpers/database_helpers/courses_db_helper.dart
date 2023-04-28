import 'package:kalam_noor/models/educational/course.dart';
import 'package:kalam_noor/tools/logic_tools/crud_interface.dart';
import '../../../tools/logic_tools/network_service.dart';

class CoursesDBHelper implements CRUDInterface<Course> {
  String get _controllerName => 'CourseController/';
  static CoursesDBHelper get instance => CoursesDBHelper();

  @override
  Future<List<Course>> getAll() async {
    String url = '${_controllerName}GetCourses';
    List<Course> allCourses = await HttpService.getParsed<List<Course>, List>(
      url: url,
      dataMapper: (parsedData) {
        return parsedData.map(
          (e) {
            return Course.fromMap(e);
          },
        ).toList();
      },
    );
    return allCourses;
  }

  @override
  Future<Course?> getById(int id) async {
    String url = '${_controllerName}GetCourseById?id=$id';
    Course? course = await HttpService.getParsed<Course?, Map<String, dynamic>>(
      url: url,
      dataMapper: (responseData) {
        return Course.fromMap(responseData);
      },
    );
    return course;
  }

  Future<List<Course>> getCoursesByClassId(int classId) async {
    String url = '${_controllerName}GetCoursesByClassId?classId=$classId';
    List<Course> classCourses = await HttpService.getParsed<List<Course>, List>(
      url: url,
      dataMapper: (parsedData) {
        return parsedData.map(
          (e) {
            return Course.fromMap(e);
          },
        ).toList();
      },
    );
    return classCourses;
  }

  Future<int> getCoursesCount() async {
    return await getAll().then((value) => value.length);
  }

  @override
  Future<bool> insert(Course object) async {
    String url = '${_controllerName}InsertCourse';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) return false;
    return result == 1;
  }

  @override
  Future<bool> update(Course object) async {
    String url = '${_controllerName}UpdateCourse';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) return false;
    return result == 1;
  }
}
