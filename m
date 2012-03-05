From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: New man page: getent(1)
Date: Tue, 6 Mar 2012 07:53:06 +1300
Message-ID: <CAKgNAkj2_c0r1bn7tQR33MHkjBgzSCSiyU7schzqKHFDPF7mfA@mail.gmail.com>
References: <18640.1320071456@proseconsulting.co.uk> <CAKgNAkj_VE+jKs8rspdw9=AwneQND9n+AWccw3JqX+CvDqX_+Q@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkj_VE+jKs8rspdw9=AwneQND9n+AWccw3JqX+CvDqX_+Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mark-/K+B3afwL8Jt0JrxVvvTASp2UmYkHbXO@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

For completeness, here was the patch I applied.

Cheers,

Michael

--- a/man1/getent.1
+++ b/man1/getent.1
@@ -26,13 +26,16 @@ getent \- get entries from Name Service Switch libraries
 .SH SYNOPSIS
 .BI "getent " database " [ " key " ... ]"
 .SH DESCRIPTION
-Displays entries from databases supported by the Name Service Switch libraries,
+The
+.I getent
+command displays entries from databases supported by the
+Name Service Switch libraries,
 which are configured in
 .IR /etc/nsswitch.conf .
 If one or more
 .I key
-is provided, then only the entries that match the supplied keys will be
-displayed.
+arguments are provided,
+then only the entries that match the supplied keys will be displayed.
 Otherwise, if no
 .I key
 is provided, all entries will be displayed (unless the database does not
@@ -40,15 +43,15 @@ support enumeration).
 .LP
 The
 .I database
-may be any supported by the GNU C Library, listed below:
+may be any of those supported by the GNU C Library, listed below:
 .RS 3
 .TP 10
 .B ahosts
 When no
 .I key
-is provided, uses
+is provided, use
 .BR sethostent (3),
-.BR gethostent (3)
+.BR gethostent (3),
 and
 .BR endhostent (3)
 to enumerate the hosts database.
@@ -56,7 +59,7 @@ This is identical to using
 .BR hosts .
 When one or more
 .I key
-is provided, passes each
+arguments are provided, pass each
 .I key
 in succession to
 .BR getaddrinfo (3)
@@ -66,14 +69,14 @@ enumerating each socket address structure returned.
 .TP
 .B ahostsv4
 Same as
-.B ahosts
-except for the address family
+.BR ahosts ,
+but use the address family
 .BR AF_INET .
 .TP
 .B ahostsv6
 Same as
-.B ahosts
-except for the address family
+.BR ahosts ,
+but use the address family
 .BR AF_INET6 .
 The call to
 .BR getaddrinfo (3)
@@ -84,30 +87,30 @@ flag.
 .B aliases
 When no
 .I key
-is provided, uses
+is provided, use
 .BR setaliasent (3),
-.BR getaliasent (3)
+.BR getaliasent (3),
 and
 .BR endaliasent (3)
 to enumerate the aliases database.
 When one or more
 .I key
-is provided, passes each
+arguments are provided, pass each
 .I key
 in succession to
 .BR getaliasbyname (3)
-and displays the result.
+and display the result.
 .TP
 .B ethers
 When one or more
 .I key
-is provided, passes each
+arguments are provided, pass each
 .I key
 in succession to
 .BR ether_aton (3)
 and
 .BR ether_hostton (3)
-until a result is obtained, and displays the result.
+until a result is obtained, and display the result.
 Enumeration is not supported on
 .BR ethers ,
 so a
@@ -117,53 +120,53 @@ must be provided.
 .B group
 When no
 .I key
-is provided, uses
+is provided, use
 .BR setgrent (3),
-.BR getgrent (3)
+.BR getgrent (3),
 and
 .BR endgrent (3)
 to enumerate the group database.
 When one or more
 .I key
-is provided, passes each numeric
+arguments are provided, pass each numeric
 .I key
 to
 .BR getgrgid (3)
-and each non-numeric
+and each nonnumeric
 .I key
 to
 .BR getgrnam (3)
-and displays the result.
+and display the result.
 .TP
 .B gshadow
 When no
 .I key
-is provided, uses
+is provided, use
 .BR setsgent (3),
-.BR getsgent (3)
+.BR getsgent (3),
 and
 .BR endsgent (3)
 to enumerate the gshadow database.
 When one or more
 .I key
-is provided, passes each
+arguments are provided, pass each
 .I key
 in succession to
 .BR getsgnam (3)
-and displays the result.
+and display the result.
 .TP
 .B hosts
 When no
 .I key
-is provided, uses
+is provided, use
 .BR sethostent (3),
-.BR gethostent (3)
+.BR gethostent (3),
 and
 .BR endhostent (3)
 to enumerate the hosts database.
 When one or more
 .I key
-is provided, passes each
+arguments are provided, pass each
 .I key
 to
 .BR gethostbyaddr (3)
@@ -173,16 +176,16 @@ depending on whether a call to
 .BR inet_pton (3)
 indicates that the
 .I key
-is an IPv6 or IPv4 address or not, and displays the result.
+is an IPv6 or IPv4 address or not, and display the result.
 .TP
 .B initgroups
 When one or more
 .I key
-is provided, passes each
+arguments are provided, pass each
 .I key
 in succession to
 .BR getgrouplist (3)
-and displays the result.
+and display the result.
 Enumeration is not supported on
 .BR initgroups ,
 so a
@@ -192,13 +195,13 @@ must be provided.
 .B netgroup
 When one
 .I key
-is provided, passes the
+is provided, pass the
 .I key
 to
 .BR setnetgrent (3)
 and, using
 .BR getnetgrent (3)
-displays the resulting string triple
+display the resulting string triple
 .RI ( hostname ", " username ", " domainname ).
 Alternatively, three
 .I keys
@@ -218,124 +221,124 @@ must be provided.
 .B networks
 When no
 .I key
-is provided, uses
+is provided, use
 .BR setnetent (3),
-.BR getnetent (3)
+.BR getnetent (3),
 and
 .BR endnetent (3)
 to enumerate the networks database.
 When one or more
 .I key
-is provided, passes each numeric
+arguments are provided, pass each numeric
 .I key
 to
 .BR getnetbyaddr (3)
-and each non-numeric
+and each nonnumeric
 .I key
 to
 .BR getnetbyname (3)
-and displays the result.
+and display the result.
 .TP
 .B passwd
 When no
 .I key
-is provided, uses
+is provided, use
 .BR setpwent (3),
-.BR getpwent (3)
+.BR getpwent (3),
 and
 .BR endpwent (3)
 to enumerate the passwd database.
 When one or more
 .I key
-is provided, passes each numeric
+arguments are provided, pass each numeric
 .I key
 to
 .BR getpwuid (3)
-and each non-numeric
+and each nonnumeric
 .I key
 to
 .BR getpwnam (3)
-and displays the result.
+and display the result.
 .TP
 .B protocols
 When no
 .I key
-is provided, uses
+is provided, use
 .BR setprotoent (3),
-.BR getprotoent (3)
+.BR getprotoent (3),
 and
 .BR endprotoent (3)
 to enumerate the protocols database.
 When one or more
 .I key
-is provided, passes each numeric
+arguments are provided, pass each numeric
 .I key
 to
 .BR getprotobynumber (3)
-and each non-numeric
+and each nonnumeric
 .I key
 to
 .BR getprotobyname (3)
-and displays the result.
+and display the result.
 .TP
 .B rpc
 When no
 .I key
-is provided, uses
+is provided, use
 .BR setrpcent (3),
-.BR getrpcent (3)
+.BR getrpcent (3),
 and
 .BR endrpcent (3)
 to enumerate the rpc database.
 When one or more
 .I key
-is provided, passes each numeric
+arguments are provided, pass each numeric
 .I key
 to
 .BR getrpcbynumber (3)
-and each non-numeric
+and each nonnumeric
 .I key
 to
 .BR getrpcbyname (3)
-and displays the result.
+and display the result.
 .TP
 .B services
 When no
 .I key
-is provided, uses
+is provided, use
 .BR setservent (3),
-.BR getservent (3)
+.BR getservent (3),
 and
 .BR endservent (3)
 to enumerate the services database.
 When one or more
 .I key
-is provided, passes each numeric
+arguments are provided, pass each numeric
 .I key
 to
 .BR getservbynumber (3)
-and each non-numeric
+and each nonnumeric
 .I key
 to
 .BR getservbyname (3)
-and displays the result.
+and display the result.
 .TP
 .B shadow
 When no
 .I key
-is provided, uses
+is provided, use
 .BR setspent (3),
-.BR getspent (3)
+.BR getspent (3),
 and
 .BR endspent (3)
 to enumerate the shadow database.
 When one or more
 .I key
-is provided, passes each
+arguments are provided, pass each
 .I key
 in succession to
 .BR getspnam (3)
-and displays the result.
+and display the result.
 .RE
 .SH "EXIT STATUS"
 One of the following exit values can be returned by
@@ -361,4 +364,4 @@ Enumeration not supported on this
 .IR database .
 .RE
 .SH "SEE ALSO"
-.BR nsswitch.conf (5).
+.BR nsswitch.conf (5)


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
