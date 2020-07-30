include: "/dv360/@{DV360}/views/*"

explore: test {
  extends: [test_core]
}


explore: test_core {
  view_name: test
  extension: required
}
