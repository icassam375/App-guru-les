class GeohashHelper {
  GeohashHelper._();

  static const String _base32 = '0123456789bcdefghjkmnpqrstuvwxyz';

  static String encode(double lat, double lng, {int precision = 7}) {
    var latMin = -90.0, latMax = 90.0, lngMin = -180.0, lngMax = 180.0;
    final sb = StringBuffer();
    var isLng = true;
    var bit = 0, ch = 0;
    while (sb.length < precision) {
      if (isLng) {
        final mid = (lngMin + lngMax) / 2;
        if (lng >= mid) {
          ch = (ch << 1) | 1;
          lngMin = mid;
        } else {
          ch = ch << 1;
          lngMax = mid;
        }
      } else {
        final mid = (latMin + latMax) / 2;
        if (lat >= mid) {
          ch = (ch << 1) | 1;
          latMin = mid;
        } else {
          ch = ch << 1;
          latMax = mid;
        }
      }
      isLng = !isLng;
      if (++bit == 5) {
        sb.write(_base32[ch]);
        bit = 0;
        ch = 0;
      }
    }
    return sb.toString();
  }
}
