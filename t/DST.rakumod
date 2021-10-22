unit module DST;

=begin comment

Note: This is hand generated for now.

Update the DST (daylight savings time) module with the desired year
('DST.pm').

  See: https://en.wikipedia.org/wiki/Uniform_Time_Act
            effective as of 2007:

           begins: 0200 local, second Sunday in March
           ends:   0200 local, first Sunday in November

=end comment

constant %dst = [

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
                          month => 'nov',
                         },
                },
     '2018' => {
                begin => {
                          day   => '11',
                          month => 'mar',
                         },
                end =>   {
                          day   => '4',
                          month => 'nov',
                         },
                },
     '2019' => {
                begin => {
                          day   => '10',
                          month => 'mar',
                         },
                end =>   {
                          day   => '3',
                          month => 'nov',
                         },
                },


     '2020' => {
                begin => {
                          day   => '8',
                          month => 'mar',
                         },
                end =>   {
                          str   => 'DST ends (0200)',
                          day   => '1',
                          time  => '0200',
                          month => 'nov',
                         },
                },


     '2021' => {
                begin => {
                          str   => 'DST begins (0200)',
                          day   => '14',
                          time  => '0200',
                          month => 'mar',
                         },
                end =>   {
                          str   => 'DST ends (0200)',
                          day   => '7',
                          time  => '0200',
                          month => 'nov',
                         },
                },


     '2022' => {
                begin => {
                          str   => 'DST begins (0200)',
                          day   => '13',
                          time  => '0200',
                          month => 'mar',
                         },
                end =>   {
                          str   => 'DST ends (0200)',
                          day   => '6',
                          time  => '0200',
                          month => 'nov',
                         },
                },


     '2023' => {
                begin => {
                          str   => 'DST begins (0200)',
                          day   => '12',
                          time  => '0200',
                          month => 'mar',
                         },
                end =>   {
                          str   => 'DST ends (0200)',
                          day   => '5',
                          time  => '0200',
                          month => 'nov',
                         },
                },


     '2024' => {
                begin => {
                          str   => 'DST begins (0200)',
                          day   => '10',
                          time  => '0200',
                          month => 'mar',
                         },
                end =>   {
                          str   => 'DST ends (0200)',
                          day   => '3',
                          time  => '0200',
                          month => 'nov',
                         },
                },


     '2025' => {
                begin => {
                          str   => 'DST begins (0200)',
                          day   => '9',
                          time  => '0200',
                          month => 'mar',
                         },
                end =>   {
                          str   => 'DST ends (0200)',
                          day   => '2',
                          time  => '0200',
                          month => 'nov',
                         },
                },


     '2026' => {
                begin => {
                          str   => 'DST begins (0200)',
                          day   => '8',
                          time  => '0200',
                          month => 'mar',
                         },
                end =>   {
                          str   => 'DST ends (0200)',
                          day   => '1',
                          time  => '0200',
                          month => 'nov',
                         },
                },


     '2027' => {
                begin => {
                          str   => 'DST begins (0200)',
                          day   => '14',
                          time  => '0200',
                          month => 'mar',
                         },
                end =>   {
                          str   => 'DST ends (0200)',
                          day   => '7',
                          time  => '0200',
                          month => 'nov',
                         },
                },


     '2028' => {
                begin => {
                          str   => 'DST begins (0200)',
                          day   => '12',
                          time  => '0200',
                          month => 'mar',
                         },
                end =>   {
                          str   => 'DST ends (0200)',
                          day   => '5',
                          time  => '0200',
                          month => 'nov',
                         },
                },


     '2029' => {
                begin => {
                          str   => 'DST begins (0200)',
                          day   => '11',
                          time  => '0200',
                          month => 'mar',
                         },
                end =>   {
                          str   => 'DST ends (0200)',
                          day   => '4',
                          time  => '0200',
                          month => 'nov',
                         },
                },


     '2030' => {
                begin => {
                          str   => 'DST begins (0200)',
                          day   => '10',
                          time  => '0200',
                          month => 'mar',
                         },
                end =>   {
                          str   => 'DST ends (0200)',
                          day   => '3',
                          time  => '0200',
                          month => 'nov',
                         },
                },


    ); # end of %dst

# end of module DST
