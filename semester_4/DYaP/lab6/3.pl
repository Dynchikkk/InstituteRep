used_for(antivirus_programs, for_secure_from_computer_viruses).

is_divided(nod32, nod32_2_7).
is_divided(nod32, nod32_2_51).

have_property(antivirus_programs, find_a_viruses).
have_property(programs_detectors, find_a_known_viruses).
have_property(doctors_programs, find_and_aid_viruses).

be(programs_filters, antivirus_programs).
be(programs_revisors, antivirus_programs).
be(programs_vaccines, antivirus_programs).
be(nod32, programs_detectors).
be(antivirus_programs, support_programs).
be(norton_antivirus, doctors_programs).
be(avast, doctors_programs).
be(programs_detectors, antivirus_programs).
be(doctors_programs, antivirus_programs).
be(doctor_web, doctors_programs).

include(software, set_of_programs).

belongs_to(antivirus_programs is software).


