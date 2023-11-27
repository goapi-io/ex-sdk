{application,go_api,
    [{compile_env,
         [{go_api,
              ['Elixir.GoApi'],
              {ok,[{cg_base_url,<<"https://api.goapi.io/">>},
                   {api_key,
                       [{stock,<<"48460632-2b88-559b-d510-b7d27eff">>},
                        {regional,<<"437cdecf-1139-5b5e-1533-7e5fc459">>},
                        {places,<<"3e79edf1-69d6-5c7d-1e3c-e81dd5db">>}]},
                   {spv_speed,5000},
                   {print_url,false}]}},
          {go_api,['Elixir.GoApiWeb.Gettext'],error}]},
     {optional_applications,[]},
     {applications,
         [kernel,stdlib,elixir,logger,runtime_tools,phoenix,telemetry_metrics,
          telemetry_poller,gettext,jason,plug_cowboy,httpoison,poison]},
     {description,"go_api"},
     {modules,
         ['Elixir.GoApi','Elixir.GoApi.Application','Elixir.GoApi.Conf',
          'Elixir.GoApi.Idx','Elixir.GoApi.Places','Elixir.GoApi.Regional',
          'Elixir.GoApi.Spv','Elixir.GoApiWeb','Elixir.GoApiWeb.Endpoint',
          'Elixir.GoApiWeb.ErrorJSON','Elixir.GoApiWeb.Gettext',
          'Elixir.GoApiWeb.Router','Elixir.GoApiWeb.Telemetry']},
     {registered,[]},
     {vsn,"0.1.0"},
     {mod,{'Elixir.GoApi.Application',[]}}]}.