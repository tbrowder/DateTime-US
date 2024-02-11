unit module DST-Data;

=begin comment

  See: https://en.wikipedia.org/wiki/Uniform_Time_Act
            effective as of 2007:

           begins: 0200 local, second Sunday in March
           ends:   0200 local, first Sunday in November

=end comment

our %dst-data is export = %(

     '2016' => {
                begin => {
                          day   => '13',
                          month => 3, # 'mar',
                         },
                end =>   {
                          day   => '6',
                          month => 11, # 'nov',
                         },
                },
     '2017' => {
                begin => {
                          day   => '12',
                          month => 3, # 'mar',
                         },
                end =>   {
                          day   => '5',
                          month => 11, # 'nov',
                         },
                },
     '2018' => {
                begin => {
                          day   => '11',
                          month => 3, # 'mar',
                         },
                end =>   {
                          day   => '4',
                          month => 11, # 'nov',
                         },
                },
     '2019' => {
                begin => {
                          day   => '10',
                          month => 3, # 'mar',
                         },
                end =>   {
                          day   => '3',
                          month => 11, # 'nov',
                         },
                },


     '2020' => {
                begin => {
                          day   => '8',
                          month => 3, # 'mar',
                         },
                end =>   {
                          day   => '1',
                          month => 11, # 'nov',
                         },
                },


     '2021' => {
                begin => {
                          day   => '14',
                          month => 3, # 'mar',
                         },
                end =>   {
                          day   => '7',
                          month => 11, # 'nov',
                         },
                },


     '2022' => {
                begin => {
                          day   => '13',
                          month => 3, # 'mar',
                         },
                end =>   {
                          day   => '6',
                          month => 11, # 'nov',
                         },
                },


     '2023' => {
                begin => {
                          day   => '12',
                          month => 3, # 'mar',
                         },
                end =>   {
                          day   => '5',
                          month => 11, # 'nov',
                         },
                },


     '2024' => {
                begin => {
                          day   => '10',
                          month => 3, # 'mar',
                         },
                end =>   {
                          day   => '3',
                          month => 11, # 'nov',
                         },
                },


     '2025' => {
                begin => {
                          day   => '9',
                          month => 3, # 'mar',
                         },
                end =>   {
                          day   => '2',
                          month => 11, # 'nov',
                         },
                },


     '2026' => {
                begin => {
                          day   => '8',
                          month => 3, # 'mar',
                         },
                end =>   {
                          day   => '1',
                          month => 11, # 'nov',
                         },
                },


     '2027' => {
                begin => {
                          day   => '14',
                          month => 3, # 'mar',
                         },
                end =>   {
                          day   => '7',
                          month => 11, # 'nov',
                         },
                },


     '2028' => {
                begin => {
                          day   => '12',
                          month => 3, # 'mar',
                         },
                end =>   {
                          day   => '5',
                          month => 11, # 'nov',
                         },
                },


     '2029' => {
                begin => {
                          day   => '11',
                          month => 3, # 'mar',
                         },
                end =>   {
                          day   => '4',
                          month => 11, # 'nov',
                         },
                },


     '2030' => {
                begin => {
                          day   => '10',
                          month => 3, # 'mar',
                         },
                end =>   {
                          day   => '3',
                          month => 11, # 'nov',
                         },
                },
); # end of %DST
