From: Gerrit Renker <gerrit-VsoRXqaLlyfQzY9nttDBhA@public.gmane.org>
Subject: Re: [manpages]: First stab at a udplite(7) manpage
Date: Mon, 30 Jun 2008 12:27:51 +0100
Message-ID: <20080630112751.GB5040@gerrit.erg.abdn.ac.uk>
References: <20080517155916.34622BD22@poczta.oswiecenia.net> <200806150158.28488.tomasz@grobelny.oswiecenia.net> <20080617111638.GA14409@gerrit.erg.abdn.ac.uk> <200806172228.06801.tomasz@grobelny.oswiecenia.net> <Pine.LNX.4.64.0806171344370.25191@shark.he.net> <cfd18e0f0806180207x783d83d0j3d5e42987be24ea6@mail.gmail.com> <20080618092707.GC23684@gerrit.erg.abdn.ac.uk> <cfd18e0f0806180248g35bec32n7977c46cbcf4142@mail.gmail.com> <20080624133625.GA16424@gerrit.erg.abdn.ac.uk> <cfd18e0f0806270203p4305cd2jae9cb8a79d7c33e9@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <cfd18e0f0806270203p4305cd2jae9cb8a79d7c33e9-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

| 
| The groff was fine.  I made a few light edits to the page.  I also
| added some comments to the page with some "FIXME(gr)" pointing to
| places where I think some work is needed.  
Thanks a lot for the review. It was particularly useful since it brought
to light an unresolved issue: when the coverage > 65535, then unexpected
things will happen since the internal fields are u16 and the
setsockopt() argument is `int'.

Will submit a bug-fix to netdev and resubmit the updated manpage when this
issue has been resolved.

Gerrit

| 
| ==============
| .\" FIXME(gr) we need a license for this page.
| .\" The one I tend to favor is shown in the capabilities.7 page,
| .\" but others are also used in man-pages (e.g., GPL, BSD).
| .TH UDPLITE  7 2008-06-23 "Linux" "Linux Programmer's Manual"
| .SH NAME
| udplite \- Lightweight User Datagram Protocol
| .SH SYNOPSIS
| .B #include <sys/socket.h>
| .br
| .\" FIXME: see #defines under `BUGS',
| .\"        when glibc supports this, add
| .\"        #include <netinet/udplite.h>
| .sp
| .B s = socket(PF_INET, SOCK_DGRAM, IPPROTO_UDPLITE);
| .SH DESCRIPTION
| This is an implementation of the Lightweight User Datagram Protocol
| (UDP-Lite), as described in RFC\ 3828.
| 
| UDP-Lite is an extension of UDP (RFC\ 768) to support variable-length
| checksums.
| This has advantages for some types of multimedia transport,
| since it makes it possible to reuse partly damaged frames
| (with few bit errors).
| .\" FIXME(gr) is "reuse" the right word in the previous sentence?
| .\" Reading the RFC suggests to me that a better wording might be:
| .\"
| .\" This has advantages for some types of multimedia transport that
| .\" may be able to make use of slightly damaged datagrams,
| .\" rather than having them discarded by lower layer protocols.
| 
| The variable-length checksum coverage is set via a
| .BR setsockopt (2)
| option.
| If this option is not set, the only difference to UDP is
| in using a different IP protocol identifier (IANA number 136).
| 
| The UDP-Lite implementation is a full extension of
| .BR udp (7),
| i.e., it shares the same API and API behaviour, and in addition
| offers two socket options to control the checksum coverage.
| .SS "Address Format"
| UDP-Litev4 uses the
| .I sockaddr_in
| address format described in
| .BR ip (7).
| UDP-Litev6 uses the
| .I sockaddr_in6
| address format described in
| .BR ipv6 (7).
| .SS "Socket Options"
| To set or get a UDP-Lite socket option, call
| .BR getsockopt (2)
| to read or
| .BR setsockopt (2)
| to write the option with the option level argument set to
| .BR IPPROTO_UDPLITE .
| In addition, all
| .B IPPROTO_UDP
| socket options are valid on a UDP-Lite socket.
| See
| .BR udp (7)
| for more information.
| 
| The following two options are specific to UDP-Lite.
| .TP
| .BR UDPLITE_SEND_CSCOV
| This option sets the sender checksum coverage and takes an
| .B int
| as argument, with a checksum coverage value in the range 0..2^16-1.
| 
| A value of 0 means that the entire datagram is always covered,
| values from 1-7 are illegal (RFC\ 3828, 3.1) and are rounded up to
| the minimum coverage of 8.
| 
| With regard to IPv6 jumbograms (RFC\ 2675), the UDP-Litev6 checksum
| coverage is limited to the first 2^16-1 octets, as per RFC\ 3828, 3.5.
| Higher values are therefore not supported.
| .\" FIXME(gr) If higher values are specified, what happens?
| .\" If they are silently ignored, probably we should explicitly
| .\" say so here.
| .TP
| .BR UDPLITE_RECV_CSCOV
| This is the receiver-side analogue and uses uses the same argument format
| and value range as
| .BR UDPLITE_SEND_CSCOV .
| This option is not required to enable traffic with partial checksum
| coverage.
| Its function is that of a traffic filter: when enabled, it
| instructs the kernel to drop all packets which have a coverage
| .I less
| than the specified coverage value.
| .\" FIXME: SO_NO_CHECK exists and is supported by UDPv4, but is
| .\" commented out in socket(7), hence also here ???
| .\".PP
| .\"Since UDP-Lite mandates checksums, checksumming can not be disabled
| .\"via the
| .\".B SO_NO_CHECK
| .\"option from
| .\".BR socket (7).
| .SH ERRORS
| All errors documented for
| .BR udp (7)
| may be returned.
| UDP-Lite does not add further errors.
| When the value of
| .B UDPLITE_RECV_CSCOV
| exceeds the actual coverage, incoming packets are silently dropped,
| but may generate a warning message in the system log.
| .SH BUGS
| .\" FIXME: remove this section once glibc supports UDP-Lite
| Where glibc support is missing, the following definitions are needed:
| .in +4n
| .nf
| 
| #define IPPROTO_UDPLITE     136
| .\" The following two are defined in the kernel in linux/net/udplite.h
| #define UDPLITE_SEND_CSCOV  10
| #define UDPLITE_RECV_CSCOV  11
| .fi
| .in
| .SH FILES
| .I /proc/net/snmp
| .br
| .IR /proc/net/snmp6
| .\" FIXME(gr)
| .\" Could you add some discussion of the UDPLITE-specific
| .\" info in these files?
| .SH VERSIONS
| UDP-Litev4/v6 first appeared in Linux 2.6.20.
| .SH "SEE ALSO"
| .BR udp (7),
| .BR ip (7),
| .BR ipv6 (7),
| .BR socket (7)
| 
| RFC\ 3828 for the Lightweight User Datagram Protocol (UDP-Lite)
| .br
| .I Documentation/networking/udplite.txt
| 

-- 
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
