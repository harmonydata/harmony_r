# MIT License
#
# Copyright (c) 2023 Ulster University (https://www.ulster.ac.uk)
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the 'Software'), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
#   The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

library(testthat)
library(harmonydata)

# create GAD-7 instrument
gad_instrument = list(
    instrument_name = "GAD-7",
    questions = list(
        list(question_no = "GAD-7_1", question_text="Feeling nervous, anxious, or on edge"),
        list(question_no = "GAD-7_2", question_text="Not being able to stop or control worrying"),
        list(question_no = "GAD-7_3", question_text="Worrying too much about different things"),
        list(question_no = "GAD-7_4", question_text="Trouble relaxing"),
        list(question_no = "GAD-7_5", question_text="Being so restless that it is hard to sit still"),
        list(question_no = "GAD-7_6", question_text="Becoming easily annoyed or irritable"),
        list(question_no = "GAD-7_7", question_text="Feeling afraid, as if something awful might happen")
    )
)

match = match_instruments(list(gad_instrument))
crosswalk_table = generate_crosswalk_table(match, 0.7)

# round match scores for testing
crosswalk_table$match_score = round(crosswalk_table$match_score, 2)

# crosswalk table from web version
expected_crosswalk_table = data.frame(
            pair_name = c("1_7", "2_3"),
            question1_no = c("GAD-7_1", "GAD-7_2"),
            question1_text = c("Feeling nervous, anxious, or on edge", "Not being able to stop or control worrying"),
            question2_no = c("GAD-7_7", "GAD-7_3"),
            question2_text = c("Feeling afraid, as if something awful might happen", "Worrying too much about different things"),
            match_score = c(0.71, 0.76)
        )

# test if the output is the same as the web version
expect_equal(crosswalk_table, expected_crosswalk_table)