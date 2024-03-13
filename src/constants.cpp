#include "constants.h"

namespace constants {

const std::string valid_arg_regex_str{"^\\+\\d{1,2}:\\d{2}$"};
const std::regex valid_arg_regex(valid_arg_regex_str,
                                 std::regex_constants::ECMAScript);

}  // namespace constants
