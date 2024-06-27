import "dart:math" as math;

class BoundingBox {
  final double x;
  final double y;
  final double width;
  final double height;

  BoundingBox(
      {required this.x,
      required this.y,
      required this.width,
      required this.height});
}

double calculateIoU(BoundingBox box1, BoundingBox box2) {
  double intersectionArea = calculateIntersectionArea(box1, box2);
  double unionArea = calculateUnionArea(box1, box2);

  return intersectionArea / unionArea;
}

double calculateIntersectionArea(BoundingBox box1, BoundingBox box2) {
  double x1 = box1.x;
  double y1 = box1.y;
  double x2 = box1.x + box1.width;
  double y2 = box1.y + box1.height;

  double x3 = box2.x;
  double y3 = box2.y;
  double x4 = box2.x + box2.width;
  double y4 = box2.y + box2.height;

  double xOverlap = math.max(0, math.min(x2, x4) - math.max(x1, x3));
  double yOverlap = math.max(0, math.min(y2, y4) - math.max(y1, y3));

  return xOverlap * yOverlap;
}

double calculateUnionArea(BoundingBox box1, BoundingBox box2) {
  double area1 = box1.width * box1.height;
  double area2 = box2.width * box2.height;

  return area1 + area2 - calculateIntersectionArea(box1, box2);
}
