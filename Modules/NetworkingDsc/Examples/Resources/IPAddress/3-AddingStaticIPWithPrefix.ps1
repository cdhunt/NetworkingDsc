<#
    .EXAMPLE
    Disabling DHCP and adding a static IP Address for IPv6 and IPv4
    using specified prefixes in CIDR notation.
#>
Configuration Example
{
    Import-DscResource -Module NetworkingDsc

    Node localhost
    {
        NetIPInterface DisableDhcp
        {
            InterfaceAlias = 'Ethernet'
            AddressFamily  = 'IPv6'
            Dhcp           = 'Disabled'
        }

        IPAddress NewIPv6Address
        {
            IPAddress      = '2001:4898:200:7:6c71:a102:ebd8:f482/64'
            InterfaceAlias = 'Ethernet'
            AddressFamily  = 'IPV6'
        }

        IPAddress NewIPv4Address
        {
            IPAddress      = '192.168.10.5/24'
            InterfaceAlias = 'Ethernet'
            AddressFamily  = 'IPV4'
        }
    }
}
