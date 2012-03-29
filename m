From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] nsswitch.conf.5: update for readability and latest glibc
Date: Fri, 30 Mar 2012 07:33:20 +1300
Message-ID: <CAKgNAkjAsWSiZEhFqnhFQDiFzLxcPzHQ1OweZswtB4q-fRf-ig@mail.gmail.com>
References: <51634.1318537560@proseconsulting.co.uk>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=14dae93404bf90b3be04bc65f6c7
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51634.1318537560-/K+B3afwL8Jt0JrxVvvTASp2UmYkHbXO@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mark-/K+B3afwL8Jt0JrxVvvTASp2UmYkHbXO@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--14dae93404bf90b3be04bc65f6c7
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 14, 2011 at 9:26 AM, Mark R Bannister
<mark-/K+B3afwL8Jt0JrxVvvTASp2UmYkHbXO@public.gmane.org> wrote:
> Hi,
>
> This patch applies to nsswitch.conf.5 in man-pages-3.36.
>
> My changes almost completely rewrite large sections of the man page. =A0T=
hey are needed to add clarity, correct grammar, reduce confusion, and bring=
 up-to-date with the latest glibc. =A0I have checked the man page against t=
he nss source code in glibc 2.14.90.
>
> Historical notes are demoted to the footer.
>
> I believe the rewrite makes the man page much clearer to understand, more=
 authoratitive and easier to read.
>
> A web version of the man page is available here for proof reading: http:/=
/prose.sourceforge.net/man/linux/nsswitch.conf.5.html
>
> A patch is copied below, and also attached to this message.
>
> I am happy for my work to be released under the terms of the GNU General =
Public License.

Thanks Mark. This looks good. I've done some light edits. Could you
please review the below (also attached).

Thanks,

Michael

.\" Copyright (c) 1998, 1999 Thorsten Kukuk (kukuk-aKQS4ZrM5Ncxnse412ns4hvVK+yQ3ZXh@public.gmane.org)
.\" Copyright (c) 2011, Mark R. Bannister <cambridge-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
.\"
.\" This is free documentation; you can redistribute it and/or
.\" modify it under the terms of the GNU General Public License as
.\" published by the Free Software Foundation; either version 2 of
.\" the License, or (at your option) any later version.
.\"
.\" The GNU General Public License's references to "object code"
.\" and "executables" are to be interpreted as the output of any
.\" document formatting or typesetting system, including
.\" intermediate and printed output.
.\"
.\" This manual is distributed in the hope that it will be useful,
.\" but WITHOUT ANY WARRANTY; without even the implied warranty of
.\" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
.\" GNU General Public License for more details.
.\"
.\" You should have received a copy of the GNU General Public
.\" License along with this manual; if not, write to the Free
.\" Software Foundation, Inc., 59 Temple Place, Suite 330, Boston,
.\" MA 02111, USA.
.\"
.TH NSSWITCH.CONF 5 2012-03-29 "Linux" "Linux Programmer's Manual"
.SH NAME
nsswitch.conf \- Name Service Switch configuration file
.SH DESCRIPTION
The
.I /etc/nsswitch.conf
("Name Server Switch", NSS)
file is a configuration file used by the GNU C Library to determine
the sources from which to obtain name-service information in
a range of categories,
and in what order.
Each category of information is identified by a database name.
.LP
The file is plain ASCII text, with columns separated by spaces or tab
characters.
The first column specifies the database name.
The remaining columns describe the order of sources to query and a
limited set of actions that can be performed by lookup result.
.LP
The following databases are understood by the GNU C Library:
.TP 12
.B aliases
Mail aliases, used by
.BR getaliasent (3)
and related functions.
.TP
.B ethers
Ethernet numbers.
.TP
.B group
Groups of users, used by
.BR getgrent (3)
and related functions.
.TP
.B hosts
Host names and numbers, used by
.BR gethostbyname (3)
and related functions.
.TP
.B netgroup
Network-wide list of hosts and users, used for access rules.
C libraries before glibc 2.1 supported netgroups only over NIS.
.TP
.B networks
Network names and numbers, used by
.BR getnetent (3)
and related functions.
.TP
.B passwd
User passwords, used by
.BR getpwent (3)
and related functions.
.TP
.B protocols
Network protocols, used by
.BR getprotoent (3)
and related functions.
.TP
.B publickey
Public and secret keys for Secure_RPC used by NFS and NIS+.
.TP
.B rpc
Remote procedure call names and numbers, used by
.BR getrpcbyname (3)
and related functions.
.TP
.B services
Network services, used by
.BR getservent (3)
and related functions.
.TP
.B shadow
Shadow user passwords, used by
.BR getspnam (3)
and related functions.
.LP
Here is an example
.I /etc/nsswitch.conf
file:
.LP
.RS 4
.PD 0
.TP 16
passwd:
compat
.TP
group:
compat
.TP
shadow:
compat
.sp 1n
.TP
hosts:
dns [!UNAVAIL=3Dreturn] files
.TP
networks:
nis [NOTFOUND=3Dreturn] files
.TP
ethers:
nis [NOTFOUND=3Dreturn] files
.TP
protocols:
nis [NOTFOUND=3Dreturn] files
.TP
rpc:
nis [NOTFOUND=3Dreturn] files
.TP
services:
nis [NOTFOUND=3Dreturn] files
.PD
.RE
.LP
The first column is the database name.
The remaining columns specify:
.IP * 3
One or more service specifications e.g., "files", "db", or "nis".
The order of the services on the line determines the order in which
those services will be queried, in turn, until a result is found.
.IP *
Optional actions to perform if a particular result is obtained
from the preceding service, e.g., "[NOTFOUND=3Dreturn]".
.RE
.LP
The service specifications supported on your system depend on the
presence of shared libraries, and are therefore extensible.
Libraries called
.IB /lib/libnss_SERVICE.so. X
will provide the named
.IR SERVICE .
On a standard installation, you can use
"files", "db", "nis", and "nisplus".
For the
.B hosts
database, you can additionally specify "dns".
For the
.BR passwd ,
.BR group ,
and
.BR shadow
databases, you can additionally specify
"compat" (see
.B "Compatibility mode"
below).
The version number
.B X
may be 1 for glibc 2.0, or 2 for glibc 2.1 and later.
On systems with additional libraries installed, you may have access to
further services such as "hesiod", "ldap", "winbind" and "wins".
.LP
An action may also be specified following a service specification.
The action modifies the behaviour following a result obtained
from the preceding data source.
Action items take the general form:
.LP
.RS 4
.RI [ STATUS =3D ACTION ]
.br
.RI [! STATUS =3D ACTION ]
.RE
.LP
where
.LP
.RS 4
.I STATUS
=3D>
.B success
|
.B notfound
|
.B unavail
|
.B tryagain
.br
.I ACTION
=3D>
.B return
|
.B continue
.RE
.LP
The ! negates the test, matching all possible results except the
one specified.
The case of the keywords is not significant.
.LP
The
.I STATUS
value is matched against the result of the lookup function called by
the preceding service specification, and can be one of:
.RS 4
.TP 12
.B success
No error occurred and the requested entry is returned.
The default action for this condition is "return".
.TP
.B notfound
The lookup succeeded, but the requested entry was not found.
The default action for this condition is "continue".
.TP
.B unavail
The service is permanently unavailable.
This can mean either that the
required file cannot be read, or, for network services, that the server
is not available or does not allow queries.
The default action for this condition is "continue".
.TP
.B tryagain
The service is temporarily unavailable.
This could mean a file is
locked or a server currently cannot accept more connections.
The default action for this condition is "continue".
.RE
.LP
The
.I ACTION
value can be one of:
.RS 4
.TP 12
.B return
Return a result now.
Do not call any further lookup functions.
.TP
.B continue
Call the next lookup function.
.RE
.SS Compatibility mode (compat)
The NSS "compat" service is similar to "files" except that it
additionally permits special entries in
.I /etc/passwd
for granting users or members of netgroups access to the system.
The following entries are valid in this mode:
.RS 4
.TP 12
.BI + user
Include the specified
.I user
from the NIS passwd map.
.TP
.BI +@ netgroup
Include all users in the given
.IR netgroup .
.TP
.BI \- user
Exclude the specified
.I user
from the NIS passwd map.
.TP
.BI \-@ netgroup
Exclude all users in the given
.IR netgroup .
.TP
.B +
Include every user, except previously excluded ones, from the
NIS passwd map.
.RE
.LP
By default the source is "nis", but this may be
overridden by specifying "nisplus" as the source for the pseudo-databases
.BR passwd_compat ,
.BR group_compat ,
and
.BR shadow_compat .
.SH FILES
A service named
.I SERVICE
is implemented by a shared object library named
.IB libnss_SERVICE.so. X
that resides in
.IR /lib .
.RS 4
.TP 25
.PD 0
.I /etc/nsswitch.conf
NSS configuration file.
.TP
.IB /lib/libnss_compat.so. X
implements "compat" source.
.TP
.IB /lib/libnss_db.so. X
implements "db" source.
.TP
.IB /lib/libnss_dns.so. X
implements "dns" source.
.TP
.IB /lib/libnss_files.so. X
implements "files" source.
.TP
.IB /lib/libnss_hesiod.so. X
implements "hesiod" source.
.TP
.IB /lib/libnss_nis.so. X
implements "nis" source.
.TP
.IB /lib/libnss_nisplus.so. X
implements "nisplus" source.
.PD
.RE
.SH NOTES
Within each process that uses
.BR nsswitch.conf ,
the entire file is read only once.
If the file is later changed, the
process will continue using the old configuration.
.LP
Traditionally, there was only a single source for service information,
often in the form of a single configuration
file (e.g., \fI/etc/passwd\fP).
However, as other name services, such as the Network Information
Service (NIS) and the Domain Name Service (DNS), became popular,
a method was needed
that would be more flexible than fixed search orders coded into
the C library.
The Names Server Switch mechanism
(based on the mechanism used by Sun Microsystems in the Solaris 2 C library=
)
introduced a cleaner solution to the problem.
.SH SEE ALSO
.BR getent (1),
.BR nss (5)

--14dae93404bf90b3be04bc65f6c7
Content-Type: application/octet-stream; name="nsswitch.conf.5"
Content-Disposition: attachment; filename="nsswitch.conf.5"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_h0e55e3i1

LlwiIENvcHlyaWdodCAoYykgMTk5OCwgMTk5OSBUaG9yc3RlbiBLdWt1ayAoa3VrdWtAdnQudW5p
LXBhZGVyYm9ybi5kZSkKLlwiIENvcHlyaWdodCAoYykgMjAxMSwgTWFyayBSLiBCYW5uaXN0ZXIg
PGNhbWJyaWRnZUB1c2Vycy5zb3VyY2Vmb3JnZS5uZXQ+Ci5cIgouXCIgVGhpcyBpcyBmcmVlIGRv
Y3VtZW50YXRpb247IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vcgouXCIgbW9kaWZ5IGl0
IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMKLlwi
IHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lv
biAyIG9mCi5cIiB0aGUgTGljZW5zZSwgb3IgKGF0IHlvdXIgb3B0aW9uKSBhbnkgbGF0ZXIgdmVy
c2lvbi4KLlwiCi5cIiBUaGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UncyByZWZlcmVuY2Vz
IHRvICJvYmplY3QgY29kZSIKLlwiIGFuZCAiZXhlY3V0YWJsZXMiIGFyZSB0byBiZSBpbnRlcnBy
ZXRlZCBhcyB0aGUgb3V0cHV0IG9mIGFueQouXCIgZG9jdW1lbnQgZm9ybWF0dGluZyBvciB0eXBl
c2V0dGluZyBzeXN0ZW0sIGluY2x1ZGluZwouXCIgaW50ZXJtZWRpYXRlIGFuZCBwcmludGVkIG91
dHB1dC4KLlwiCi5cIiBUaGlzIG1hbnVhbCBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0
IGl0IHdpbGwgYmUgdXNlZnVsLAouXCIgYnV0IFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRob3V0
IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YKLlwiIE1FUkNIQU5UQUJJTElUWSBvciBGSVRO
RVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4gIFNlZSB0aGUKLlwiIEdOVSBHZW5lcmFsIFB1
YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMuCi5cIgouXCIgWW91IHNob3VsZCBoYXZlIHJl
Y2VpdmVkIGEgY29weSBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljCi5cIiBMaWNlbnNlIGFsb25n
IHdpdGggdGhpcyBtYW51YWw7IGlmIG5vdCwgd3JpdGUgdG8gdGhlIEZyZWUKLlwiIFNvZnR3YXJl
IEZvdW5kYXRpb24sIEluYy4sIDU5IFRlbXBsZSBQbGFjZSwgU3VpdGUgMzMwLCBCb3N0b24sCi5c
IiBNQSAwMjExMSwgVVNBLgouXCIKLlRIIE5TU1dJVENILkNPTkYgNSAyMDEyLTAzLTI5ICJMaW51
eCIgIkxpbnV4IFByb2dyYW1tZXIncyBNYW51YWwiCi5TSCBOQU1FCm5zc3dpdGNoLmNvbmYgXC0g
TmFtZSBTZXJ2aWNlIFN3aXRjaCBjb25maWd1cmF0aW9uIGZpbGUKLlNIIERFU0NSSVBUSU9OClRo
ZQouSSAvZXRjL25zc3dpdGNoLmNvbmYKKCJOYW1lIFNlcnZlciBTd2l0Y2giLCBOU1MpCmZpbGUg
aXMgYSBjb25maWd1cmF0aW9uIGZpbGUgdXNlZCBieSB0aGUgR05VIEMgTGlicmFyeSB0byBkZXRl
cm1pbmUKdGhlIHNvdXJjZXMgZnJvbSB3aGljaCB0byBvYnRhaW4gbmFtZS1zZXJ2aWNlIGluZm9y
bWF0aW9uIGluCmEgcmFuZ2Ugb2YgY2F0ZWdvcmllcywKYW5kIGluIHdoYXQgb3JkZXIuCkVhY2gg
Y2F0ZWdvcnkgb2YgaW5mb3JtYXRpb24gaXMgaWRlbnRpZmllZCBieSBhIGRhdGFiYXNlIG5hbWUu
Ci5MUApUaGUgZmlsZSBpcyBwbGFpbiBBU0NJSSB0ZXh0LCB3aXRoIGNvbHVtbnMgc2VwYXJhdGVk
IGJ5IHNwYWNlcyBvciB0YWIKY2hhcmFjdGVycy4KVGhlIGZpcnN0IGNvbHVtbiBzcGVjaWZpZXMg
dGhlIGRhdGFiYXNlIG5hbWUuClRoZSByZW1haW5pbmcgY29sdW1ucyBkZXNjcmliZSB0aGUgb3Jk
ZXIgb2Ygc291cmNlcyB0byBxdWVyeSBhbmQgYQpsaW1pdGVkIHNldCBvZiBhY3Rpb25zIHRoYXQg
Y2FuIGJlIHBlcmZvcm1lZCBieSBsb29rdXAgcmVzdWx0LgouTFAKVGhlIGZvbGxvd2luZyBkYXRh
YmFzZXMgYXJlIHVuZGVyc3Rvb2QgYnkgdGhlIEdOVSBDIExpYnJhcnk6Ci5UUCAxMgouQiBhbGlh
c2VzCk1haWwgYWxpYXNlcywgdXNlZCBieQouQlIgZ2V0YWxpYXNlbnQgKDMpCmFuZCByZWxhdGVk
IGZ1bmN0aW9ucy4KLlRQCi5CIGV0aGVycwpFdGhlcm5ldCBudW1iZXJzLgouVFAKLkIgZ3JvdXAK
R3JvdXBzIG9mIHVzZXJzLCB1c2VkIGJ5Ci5CUiBnZXRncmVudCAoMykKYW5kIHJlbGF0ZWQgZnVu
Y3Rpb25zLgouVFAKLkIgaG9zdHMKSG9zdCBuYW1lcyBhbmQgbnVtYmVycywgdXNlZCBieQouQlIg
Z2V0aG9zdGJ5bmFtZSAoMykKYW5kIHJlbGF0ZWQgZnVuY3Rpb25zLgouVFAKLkIgbmV0Z3JvdXAK
TmV0d29yay13aWRlIGxpc3Qgb2YgaG9zdHMgYW5kIHVzZXJzLCB1c2VkIGZvciBhY2Nlc3MgcnVs
ZXMuCkMgbGlicmFyaWVzIGJlZm9yZSBnbGliYyAyLjEgc3VwcG9ydGVkIG5ldGdyb3VwcyBvbmx5
IG92ZXIgTklTLgouVFAKLkIgbmV0d29ya3MKTmV0d29yayBuYW1lcyBhbmQgbnVtYmVycywgdXNl
ZCBieQouQlIgZ2V0bmV0ZW50ICgzKQphbmQgcmVsYXRlZCBmdW5jdGlvbnMuCi5UUAouQiBwYXNz
d2QKVXNlciBwYXNzd29yZHMsIHVzZWQgYnkKLkJSIGdldHB3ZW50ICgzKQphbmQgcmVsYXRlZCBm
dW5jdGlvbnMuCi5UUAouQiBwcm90b2NvbHMKTmV0d29yayBwcm90b2NvbHMsIHVzZWQgYnkKLkJS
IGdldHByb3RvZW50ICgzKQphbmQgcmVsYXRlZCBmdW5jdGlvbnMuCi5UUAouQiBwdWJsaWNrZXkK
UHVibGljIGFuZCBzZWNyZXQga2V5cyBmb3IgU2VjdXJlX1JQQyB1c2VkIGJ5IE5GUyBhbmQgTklT
Ky4KLlRQCi5CIHJwYwpSZW1vdGUgcHJvY2VkdXJlIGNhbGwgbmFtZXMgYW5kIG51bWJlcnMsIHVz
ZWQgYnkKLkJSIGdldHJwY2J5bmFtZSAoMykKYW5kIHJlbGF0ZWQgZnVuY3Rpb25zLgouVFAKLkIg
c2VydmljZXMKTmV0d29yayBzZXJ2aWNlcywgdXNlZCBieQouQlIgZ2V0c2VydmVudCAoMykKYW5k
IHJlbGF0ZWQgZnVuY3Rpb25zLgouVFAKLkIgc2hhZG93ClNoYWRvdyB1c2VyIHBhc3N3b3Jkcywg
dXNlZCBieQouQlIgZ2V0c3BuYW0gKDMpCmFuZCByZWxhdGVkIGZ1bmN0aW9ucy4KLkxQCkhlcmUg
aXMgYW4gZXhhbXBsZQouSSAvZXRjL25zc3dpdGNoLmNvbmYKZmlsZToKLkxQCi5SUyA0Ci5QRCAw
Ci5UUCAxNgpwYXNzd2Q6CmNvbXBhdAouVFAKZ3JvdXA6CmNvbXBhdAouVFAKc2hhZG93Ogpjb21w
YXQKLnNwIDFuCi5UUApob3N0czoKZG5zIFshVU5BVkFJTD1yZXR1cm5dIGZpbGVzCi5UUApuZXR3
b3JrczoKbmlzIFtOT1RGT1VORD1yZXR1cm5dIGZpbGVzCi5UUApldGhlcnM6Cm5pcyBbTk9URk9V
TkQ9cmV0dXJuXSBmaWxlcwouVFAKcHJvdG9jb2xzOgpuaXMgW05PVEZPVU5EPXJldHVybl0gZmls
ZXMKLlRQCnJwYzoKbmlzIFtOT1RGT1VORD1yZXR1cm5dIGZpbGVzCi5UUApzZXJ2aWNlczoKbmlz
IFtOT1RGT1VORD1yZXR1cm5dIGZpbGVzCi5QRAouUkUKLkxQClRoZSBmaXJzdCBjb2x1bW4gaXMg
dGhlIGRhdGFiYXNlIG5hbWUuClRoZSByZW1haW5pbmcgY29sdW1ucyBzcGVjaWZ5OgouSVAgKiAz
Ck9uZSBvciBtb3JlIHNlcnZpY2Ugc3BlY2lmaWNhdGlvbnMgZS5nLiwgImZpbGVzIiwgImRiIiwg
b3IgIm5pcyIuClRoZSBvcmRlciBvZiB0aGUgc2VydmljZXMgb24gdGhlIGxpbmUgZGV0ZXJtaW5l
cyB0aGUgb3JkZXIgaW4gd2hpY2gKdGhvc2Ugc2VydmljZXMgd2lsbCBiZSBxdWVyaWVkLCBpbiB0
dXJuLCB1bnRpbCBhIHJlc3VsdCBpcyBmb3VuZC4KLklQICoKT3B0aW9uYWwgYWN0aW9ucyB0byBw
ZXJmb3JtIGlmIGEgcGFydGljdWxhciByZXN1bHQgaXMgb2J0YWluZWQKZnJvbSB0aGUgcHJlY2Vk
aW5nIHNlcnZpY2UsIGUuZy4sICJbTk9URk9VTkQ9cmV0dXJuXSIuCi5SRQouTFAKVGhlIHNlcnZp
Y2Ugc3BlY2lmaWNhdGlvbnMgc3VwcG9ydGVkIG9uIHlvdXIgc3lzdGVtIGRlcGVuZCBvbiB0aGUK
cHJlc2VuY2Ugb2Ygc2hhcmVkIGxpYnJhcmllcywgYW5kIGFyZSB0aGVyZWZvcmUgZXh0ZW5zaWJs
ZS4KTGlicmFyaWVzIGNhbGxlZAouSUIgL2xpYi9saWJuc3NfU0VSVklDRS5zby4gWAp3aWxsIHBy
b3ZpZGUgdGhlIG5hbWVkCi5JUiBTRVJWSUNFIC4KT24gYSBzdGFuZGFyZCBpbnN0YWxsYXRpb24s
IHlvdSBjYW4gdXNlCiJmaWxlcyIsICJkYiIsICJuaXMiLCBhbmQgIm5pc3BsdXMiLgpGb3IgdGhl
Ci5CIGhvc3RzCmRhdGFiYXNlLCB5b3UgY2FuIGFkZGl0aW9uYWxseSBzcGVjaWZ5ICJkbnMiLgpG
b3IgdGhlCi5CUiBwYXNzd2QgLAouQlIgZ3JvdXAgLAphbmQKLkJSIHNoYWRvdwpkYXRhYmFzZXMs
IHlvdSBjYW4gYWRkaXRpb25hbGx5IHNwZWNpZnkKImNvbXBhdCIgKHNlZQouQiAiQ29tcGF0aWJp
bGl0eSBtb2RlIgpiZWxvdykuClRoZSB2ZXJzaW9uIG51bWJlcgouQiBYCm1heSBiZSAxIGZvciBn
bGliYyAyLjAsIG9yIDIgZm9yIGdsaWJjIDIuMSBhbmQgbGF0ZXIuCk9uIHN5c3RlbXMgd2l0aCBh
ZGRpdGlvbmFsIGxpYnJhcmllcyBpbnN0YWxsZWQsIHlvdSBtYXkgaGF2ZSBhY2Nlc3MgdG8KZnVy
dGhlciBzZXJ2aWNlcyBzdWNoIGFzICJoZXNpb2QiLCAibGRhcCIsICJ3aW5iaW5kIiBhbmQgIndp
bnMiLgouTFAKQW4gYWN0aW9uIG1heSBhbHNvIGJlIHNwZWNpZmllZCBmb2xsb3dpbmcgYSBzZXJ2
aWNlIHNwZWNpZmljYXRpb24uClRoZSBhY3Rpb24gbW9kaWZpZXMgdGhlIGJlaGF2aW91ciBmb2xs
b3dpbmcgYSByZXN1bHQgb2J0YWluZWQKZnJvbSB0aGUgcHJlY2VkaW5nIGRhdGEgc291cmNlLgpB
Y3Rpb24gaXRlbXMgdGFrZSB0aGUgZ2VuZXJhbCBmb3JtOgouTFAKLlJTIDQKLlJJIFsgU1RBVFVT
ID0gQUNUSU9OIF0KLmJyCi5SSSBbISBTVEFUVVMgPSBBQ1RJT04gXQouUkUKLkxQCndoZXJlCi5M
UAouUlMgNAouSSBTVEFUVVMKPT4KLkIgc3VjY2Vzcwp8Ci5CIG5vdGZvdW5kCnwKLkIgdW5hdmFp
bAp8Ci5CIHRyeWFnYWluCi5icgouSSBBQ1RJT04KPT4KLkIgcmV0dXJuCnwKLkIgY29udGludWUK
LlJFCi5MUApUaGUgISBuZWdhdGVzIHRoZSB0ZXN0LCBtYXRjaGluZyBhbGwgcG9zc2libGUgcmVz
dWx0cyBleGNlcHQgdGhlCm9uZSBzcGVjaWZpZWQuClRoZSBjYXNlIG9mIHRoZSBrZXl3b3JkcyBp
cyBub3Qgc2lnbmlmaWNhbnQuCi5MUApUaGUKLkkgU1RBVFVTCnZhbHVlIGlzIG1hdGNoZWQgYWdh
aW5zdCB0aGUgcmVzdWx0IG9mIHRoZSBsb29rdXAgZnVuY3Rpb24gY2FsbGVkIGJ5CnRoZSBwcmVj
ZWRpbmcgc2VydmljZSBzcGVjaWZpY2F0aW9uLCBhbmQgY2FuIGJlIG9uZSBvZjoKLlJTIDQKLlRQ
IDEyCi5CIHN1Y2Nlc3MKTm8gZXJyb3Igb2NjdXJyZWQgYW5kIHRoZSByZXF1ZXN0ZWQgZW50cnkg
aXMgcmV0dXJuZWQuClRoZSBkZWZhdWx0IGFjdGlvbiBmb3IgdGhpcyBjb25kaXRpb24gaXMgInJl
dHVybiIuCi5UUAouQiBub3Rmb3VuZApUaGUgbG9va3VwIHN1Y2NlZWRlZCwgYnV0IHRoZSByZXF1
ZXN0ZWQgZW50cnkgd2FzIG5vdCBmb3VuZC4KVGhlIGRlZmF1bHQgYWN0aW9uIGZvciB0aGlzIGNv
bmRpdGlvbiBpcyAiY29udGludWUiLgouVFAKLkIgdW5hdmFpbApUaGUgc2VydmljZSBpcyBwZXJt
YW5lbnRseSB1bmF2YWlsYWJsZS4KVGhpcyBjYW4gbWVhbiBlaXRoZXIgdGhhdCB0aGUKcmVxdWly
ZWQgZmlsZSBjYW5ub3QgYmUgcmVhZCwgb3IsIGZvciBuZXR3b3JrIHNlcnZpY2VzLCB0aGF0IHRo
ZSBzZXJ2ZXIKaXMgbm90IGF2YWlsYWJsZSBvciBkb2VzIG5vdCBhbGxvdyBxdWVyaWVzLgpUaGUg
ZGVmYXVsdCBhY3Rpb24gZm9yIHRoaXMgY29uZGl0aW9uIGlzICJjb250aW51ZSIuCi5UUAouQiB0
cnlhZ2FpbgpUaGUgc2VydmljZSBpcyB0ZW1wb3JhcmlseSB1bmF2YWlsYWJsZS4KVGhpcyBjb3Vs
ZCBtZWFuIGEgZmlsZSBpcwpsb2NrZWQgb3IgYSBzZXJ2ZXIgY3VycmVudGx5IGNhbm5vdCBhY2Nl
cHQgbW9yZSBjb25uZWN0aW9ucy4KVGhlIGRlZmF1bHQgYWN0aW9uIGZvciB0aGlzIGNvbmRpdGlv
biBpcyAiY29udGludWUiLgouUkUKLkxQClRoZQouSSBBQ1RJT04KdmFsdWUgY2FuIGJlIG9uZSBv
ZjoKLlJTIDQKLlRQIDEyCi5CIHJldHVybgpSZXR1cm4gYSByZXN1bHQgbm93LgpEbyBub3QgY2Fs
bCBhbnkgZnVydGhlciBsb29rdXAgZnVuY3Rpb25zLgouVFAKLkIgY29udGludWUKQ2FsbCB0aGUg
bmV4dCBsb29rdXAgZnVuY3Rpb24uCi5SRQouU1MgQ29tcGF0aWJpbGl0eSBtb2RlIChjb21wYXQp
ClRoZSBOU1MgImNvbXBhdCIgc2VydmljZSBpcyBzaW1pbGFyIHRvICJmaWxlcyIgZXhjZXB0IHRo
YXQgaXQKYWRkaXRpb25hbGx5IHBlcm1pdHMgc3BlY2lhbCBlbnRyaWVzIGluCi5JIC9ldGMvcGFz
c3dkCmZvciBncmFudGluZyB1c2VycyBvciBtZW1iZXJzIG9mIG5ldGdyb3VwcyBhY2Nlc3MgdG8g
dGhlIHN5c3RlbS4KVGhlIGZvbGxvd2luZyBlbnRyaWVzIGFyZSB2YWxpZCBpbiB0aGlzIG1vZGU6
Ci5SUyA0Ci5UUCAxMgouQkkgKyB1c2VyCkluY2x1ZGUgdGhlIHNwZWNpZmllZAouSSB1c2VyCmZy
b20gdGhlIE5JUyBwYXNzd2QgbWFwLgouVFAKLkJJICtAIG5ldGdyb3VwCkluY2x1ZGUgYWxsIHVz
ZXJzIGluIHRoZSBnaXZlbgouSVIgbmV0Z3JvdXAgLgouVFAKLkJJIFwtIHVzZXIKRXhjbHVkZSB0
aGUgc3BlY2lmaWVkCi5JIHVzZXIKZnJvbSB0aGUgTklTIHBhc3N3ZCBtYXAuCi5UUAouQkkgXC1A
IG5ldGdyb3VwCkV4Y2x1ZGUgYWxsIHVzZXJzIGluIHRoZSBnaXZlbgouSVIgbmV0Z3JvdXAgLgou
VFAKLkIgKwpJbmNsdWRlIGV2ZXJ5IHVzZXIsIGV4Y2VwdCBwcmV2aW91c2x5IGV4Y2x1ZGVkIG9u
ZXMsIGZyb20gdGhlCk5JUyBwYXNzd2QgbWFwLgouUkUKLkxQCkJ5IGRlZmF1bHQgdGhlIHNvdXJj
ZSBpcyAibmlzIiwgYnV0IHRoaXMgbWF5IGJlCm92ZXJyaWRkZW4gYnkgc3BlY2lmeWluZyAibmlz
cGx1cyIgYXMgdGhlIHNvdXJjZSBmb3IgdGhlIHBzZXVkby1kYXRhYmFzZXMKLkJSIHBhc3N3ZF9j
b21wYXQgLAouQlIgZ3JvdXBfY29tcGF0ICwKYW5kCi5CUiBzaGFkb3dfY29tcGF0IC4KLlNIIEZJ
TEVTCkEgc2VydmljZSBuYW1lZAouSSBTRVJWSUNFCmlzIGltcGxlbWVudGVkIGJ5IGEgc2hhcmVk
IG9iamVjdCBsaWJyYXJ5IG5hbWVkCi5JQiBsaWJuc3NfU0VSVklDRS5zby4gWAp0aGF0IHJlc2lk
ZXMgaW4KLklSIC9saWIgLgouUlMgNAouVFAgMjUKLlBEIDAKLkkgL2V0Yy9uc3N3aXRjaC5jb25m
Ck5TUyBjb25maWd1cmF0aW9uIGZpbGUuCi5UUAouSUIgL2xpYi9saWJuc3NfY29tcGF0LnNvLiBY
CmltcGxlbWVudHMgImNvbXBhdCIgc291cmNlLgouVFAKLklCIC9saWIvbGlibnNzX2RiLnNvLiBY
CmltcGxlbWVudHMgImRiIiBzb3VyY2UuCi5UUAouSUIgL2xpYi9saWJuc3NfZG5zLnNvLiBYCmlt
cGxlbWVudHMgImRucyIgc291cmNlLgouVFAKLklCIC9saWIvbGlibnNzX2ZpbGVzLnNvLiBYCmlt
cGxlbWVudHMgImZpbGVzIiBzb3VyY2UuCi5UUAouSUIgL2xpYi9saWJuc3NfaGVzaW9kLnNvLiBY
CmltcGxlbWVudHMgImhlc2lvZCIgc291cmNlLgouVFAKLklCIC9saWIvbGlibnNzX25pcy5zby4g
WAppbXBsZW1lbnRzICJuaXMiIHNvdXJjZS4KLlRQCi5JQiAvbGliL2xpYm5zc19uaXNwbHVzLnNv
LiBYCmltcGxlbWVudHMgIm5pc3BsdXMiIHNvdXJjZS4KLlBECi5SRQouU0ggTk9URVMKV2l0aGlu
IGVhY2ggcHJvY2VzcyB0aGF0IHVzZXMKLkJSIG5zc3dpdGNoLmNvbmYgLAp0aGUgZW50aXJlIGZp
bGUgaXMgcmVhZCBvbmx5IG9uY2UuCklmIHRoZSBmaWxlIGlzIGxhdGVyIGNoYW5nZWQsIHRoZQpw
cm9jZXNzIHdpbGwgY29udGludWUgdXNpbmcgdGhlIG9sZCBjb25maWd1cmF0aW9uLgouTFAKVHJh
ZGl0aW9uYWxseSwgdGhlcmUgd2FzIG9ubHkgYSBzaW5nbGUgc291cmNlIGZvciBzZXJ2aWNlIGlu
Zm9ybWF0aW9uLApvZnRlbiBpbiB0aGUgZm9ybSBvZiBhIHNpbmdsZSBjb25maWd1cmF0aW9uCmZp
bGUgKGUuZy4sIFxmSS9ldGMvcGFzc3dkXGZQKS4KSG93ZXZlciwgYXMgb3RoZXIgbmFtZSBzZXJ2
aWNlcywgc3VjaCBhcyB0aGUgTmV0d29yayBJbmZvcm1hdGlvbgpTZXJ2aWNlIChOSVMpIGFuZCB0
aGUgRG9tYWluIE5hbWUgU2VydmljZSAoRE5TKSwgYmVjYW1lIHBvcHVsYXIsCmEgbWV0aG9kIHdh
cyBuZWVkZWQKdGhhdCB3b3VsZCBiZSBtb3JlIGZsZXhpYmxlIHRoYW4gZml4ZWQgc2VhcmNoIG9y
ZGVycyBjb2RlZCBpbnRvCnRoZSBDIGxpYnJhcnkuClRoZSBOYW1lcyBTZXJ2ZXIgU3dpdGNoIG1l
Y2hhbmlzbQooYmFzZWQgb24gdGhlIG1lY2hhbmlzbSB1c2VkIGJ5IFN1biBNaWNyb3N5c3RlbXMg
aW4gdGhlIFNvbGFyaXMgMiBDIGxpYnJhcnkpCmludHJvZHVjZWQgYSBjbGVhbmVyIHNvbHV0aW9u
IHRvIHRoZSBwcm9ibGVtLgouU0ggU0VFIEFMU08KLkJSIGdldGVudCAoMSksCi5CUiBuc3MgKDUp
Cg==
--14dae93404bf90b3be04bc65f6c7--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
