class EducationCheckerHelper {
  static List<bool> status(education) {
    final tenth = education?.the10Th?.board != null && education?.the10Th?.medium != null && education?.the10Th?.passingYear != null && education?.the10Th?.percentageORmarks != null;
    final twelfth = education?.the12Th?.board != null && education?.the12Th?.medium != null && education?.the12Th?.passingYear != null && education?.the12Th?.percentageORmarks != null;
    final diploma = education?.diploma?.degreeName != null &&
        education?.diploma?.fieldOfStudy != null &&
        education?.diploma?.collegeORuniversity != null &&
        education?.diploma?.degreeType != null &&
        education?.diploma?.lat != null &&
        education?.diploma?.lng != null &&
        education?.diploma?.passingYear != null &&
        education?.diploma?.percentageORmarks != null;
    final graduate = education?.graduate?.degreeName != null &&
        education?.graduate?.fieldOfStudy != null &&
        education?.graduate?.collegeORuniversity != null &&
        education?.graduate?.degreeType != null &&
        education?.graduate?.lat != null &&
        education?.graduate?.lng != null &&
        education?.graduate?.passingYear != null &&
        education?.graduate?.percentageORmarks != null;
    final pg = education?.pg?.degreeName != null &&
        education?.pg?.fieldOfStudy != null &&
        education?.pg?.collegeORuniversity != null &&
        education?.pg?.degreeType != null &&
        education?.pg?.lat != null &&
        education?.pg?.lng != null &&
        education?.pg?.passingYear != null &&
        education?.pg?.percentageORmarks != null;
    final doctorate = education?.doctorate?.degreeName != null &&
        education?.doctorate?.fieldOfStudy != null &&
        education?.doctorate?.collegeORuniversity != null &&
        education?.doctorate?.degreeType != null &&
        education?.doctorate?.lat != null &&
        education?.doctorate?.lng != null &&
        education?.doctorate?.passingYear != null &&
        education?.doctorate?.percentageORmarks != null;
    final englishProficiency = education?.englishProficiency != null && education?.englishProficiency != -1;
    final technicalDegrees = education?.technicalDegrees?.isNotEmpty ?? false;

    return [tenth, twelfth, diploma, graduate, pg, doctorate, englishProficiency, technicalDegrees];
  }
}
