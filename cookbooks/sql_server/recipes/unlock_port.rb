# unlock port in firewall
# this should leverage firewall_rule resource
# once COOK-689 is completed
firewall_rule_name = "#{node['sql_server']['instance_name']} Static Port"

execute "open-static-port" do
  command "netsh advfirewall firewall add rule name=\"#{firewall_rule_name}\" dir=in action=allow protocol=TCP localport=#{node['sql_server']['port']}"
  returns [0,1,42] # *sigh* cmd.exe return codes are wonky
  not_if { SqlServer::Helper.firewall_rule_enabled?(firewall_rule_name) }
end
