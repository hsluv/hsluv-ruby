require "husl/version"

module Husl
  extend self

  M = [
    [3.240969941904521, -1.537383177570093, -0.498610760293],
    [-0.96924363628087, 1.87596750150772, 0.041555057407175],
    [0.055630079696993, -0.20397695888897, 1.056971514242878],
  ]

  M_INV = [
    [0.41239079926595, 0.35758433938387, 0.18048078840183],
    [0.21263900587151, 0.71516867876775, 0.072192315360733],
    [0.019330818715591, 0.11919477979462, 0.95053215224966],
  ]

  REF_X = 0.95045592705167
  REF_Y = 1.0
  REF_Z = 1.089057750759878
  REF_U = 0.19783000664283
  REF_V = 0.46831999493879
  KAPPA = 903.2962962
  EPSILON = 0.0088564516

  def rgb_to_xyz arr
    rgbl = arr.map { |val| to_linear(val) }
    M_INV.map { |i| dot_product(i, rgbl) }
  end

  def xyz_to_luv arr
    x, y, z = arr
    l = f(y)

    return [0.0, 0.0, 0.0] if [x, y, z, 0.0].uniq.length == 1 || l == 0.0

    var_u = (4.0 * x) / (x + (15.0 * y) + (3.0 * z))
    var_v = (9.0 * y) / (x + (15.0 * y) + (3.0 * z))
    u = 13.0 * l * (var_u - REF_U)
    v = 13.0 * l * (var_v - REF_V)

    [l, u, v]
  end

  def luv_to_lch arr
    l, u, v = arr
    c = ((u ** 2) + (v ** 2)) ** (1 / 2.0)
    hrad = Math.atan2(v, u)
    h = radians_to_degrees(hrad)
    h += 360.0 if h < 0.0
    [l, c, h]
  end

  def radians_to_degrees rad
    rad * 180.0 / Math::PI
  end

  def f t
    t > EPSILON ? 116 * ((t / REF_Y) ** (1.0 / 3.0)) - 16.0 : t / REF_Y * KAPPA
  end

  def to_linear c
    c > 0.04045 ? ((c + 0.055) / 1.055) ** 2.4 : c / 12.92
  end

  def dot_product a, b
    a.zip(b).map { |i, j| i * j }.inject(:+)
  end
end
