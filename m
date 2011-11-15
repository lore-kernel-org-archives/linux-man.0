From: Mark R Bannister <mark-/K+B3afwL8Jt0JrxVvvTASp2UmYkHbXO@public.gmane.org>
Subject: New man page: scandirat(3)
Date: Tue, 15 Nov 2011 13:09:01 +0000
Message-ID: <43540.1321362541@proseconsulting.co.uk>
Reply-To: mark-/K+B3afwL8Jt0JrxVvvTASp2UmYkHbXO@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="=_a64c148867b1a0007617c55ecd014f65"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--=_a64c148867b1a0007617c55ecd014f65
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi,

I've written a man page for scandirat(3) that is new to glibc 2.15.  The ma=
n page is based on the text used in mkfifoat(3) which was very similar.  I =
am happy for this man page to be distributed under the terms of the GNU Gen=
eral Public License version 3 or later.

The information in the man page was checked against the source code for gli=
bc 2.15.

I include the patch inline below, and also as an attachment.

Best regards,
Mark Bannister.

=2E\" Hey Emacs! This file is -*- nroff -*- source.
=2E\"
=2E\" Copyright (c) 2011, Mark R. Bannister <cambridge-Rn4VEauK+AKRv+LV9MX5uv+2+P5yyue3@public.gmane.org=
t>
=2E\"        based on text in mkfifoat.3 Copyright (c) 2006, Michael Kerris=
k
=2E\"
=2E\" This is free documentation; you can redistribute it and/or
=2E\" modify it under the terms of the GNU General Public License as
=2E\" published by the Free Software Foundation; either version 3 of
=2E\" the License, or (at your option) any later version.
=2E\"
=2E\" The GNU General Public License's references to "object code"
=2E\" and "executables" are to be interpreted as the output of any
=2E\" document formatting or typesetting system, including
=2E\" intermediate and printed output.
=2E\"
=2E\" This manual is distributed in the hope that it will be useful,
=2E\" but WITHOUT ANY WARRANTY; without even the implied warranty of
=2E\" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
=2E\" GNU General Public License for more details.
=2E\"
=2E\" You should have received a copy of the GNU General Public
=2E\" License along with this manual; if not, write to the Free
=2E\" Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 021=
11,
=2E\" USA.
=2E\"
=2ETH SCANDIRAT 3 2011-11-15 "Linux" "Linux Programmer's Manual"
=2ESH NAME
scandirat \- scan a directory relative to a directory file descriptor
=2ESH SYNOPSIS
=2Enf
=2EB #include <fcntl.h>           /* Definition of AT_* constants */
=2EB #include <dirent.h>
=2Esp
=2Efi
=2EBI "int scandir(int " dirfd ", const char *" dirp ","
=2EBI "struct dirent ***" namelist ,
=2Enf
=2ERS
=2EBI "int (*" filter ")(const struct dirent *),"
=2EBI "int (*" compar ")(const struct dirent **, const struct dirent **));"
=2ERE
=2Efi
=2ESH DESCRIPTION
The
=2EBR scandirat ()
system call operates in exactly the same way as
=2EBR scandir (3),
except for the differences described in this manual page.

If the pathname given in
=2EI dirp
is relative, then it is interpreted relative to the directory
referred to by the file descriptor
=2EI dirfd
(rather than relative to the current working directory of
the calling process, as is done by
=2EBR scandir (3)
for a relative pathname).

If
=2EI dirp
is relative and
=2EI dirfd
is the special value
=2EBR AT_FDCWD ,
then
=2EI dirp
is interpreted relative to the current working
directory of the calling process (like
=2EBR scandir (3)).

If
=2EI dirp
is absolute, then
=2EI dirfd
is ignored.
=2ESH "RETURN VALUE"
On success,
=2EBR scandirat ()
returns the number of directory entries selected.
On error, \-1 is returned and
=2EI errno
is set to indicate the error.
=2ESH ERRORS
The same errors that occur for
=2EBR scandir (3)
can also occur for
=2EBR scandirat ().
The following additional errors can occur for
=2EBR scandirat ():
=2ETP
=2EB EBADF
=2EI dirfd
is not a valid file descriptor.
=2ETP
=2EB ENOTDIR
=2EI dirp
is a relative path and
=2EI dirfd
is a file descriptor referring to a file other than a directory.
=2ESH VERSIONS
=2EBR scandirat ()
was added to glibc in version 2.15.
=2ESH "CONFORMING TO"
This system call is non-standard but is proposed for inclusion in a
future revision of POSIX.1.
=2ESH NOTES
See
=2EBR openat (2)
for an explanation of the need for
=2EBR scandirat ().
=2ESH "SEE ALSO"
=2EBR openat (2),
=2EBR scandir (3),
=2EBR path_resolution (7).


=20

--=_a64c148867b1a0007617c55ecd014f65
Content-Transfer-Encoding: base64
Content-Type: application/octet-stream;
 name="scandirat.3";
Content-Disposition: attachment;
 filename="scandirat.3";

LlwiIEhleSBFbWFjcyEgVGhpcyBmaWxlIGlzIC0qLSBucm9mZiAtKi0gc291cmNlLgouXCIKLlwi
IENvcHlyaWdodCAoYykgMjAxMSwgTWFyayBSLiBCYW5uaXN0ZXIgPGNhbWJyaWRnZUB1c2Vycy5z
b3VyY2Vmb3JnZS5uZXQ+Ci5cIiAgICAgICAgYmFzZWQgb24gdGV4dCBpbiBta2ZpZm9hdC4zIENv
cHlyaWdodCAoYykgMjAwNiwgTWljaGFlbCBLZXJyaXNrCi5cIgouXCIgVGhpcyBpcyBmcmVlIGRv
Y3VtZW50YXRpb247IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vcgouXCIgbW9kaWZ5IGl0
IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMKLlwi
IHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lv
biAzIG9mCi5cIiB0aGUgTGljZW5zZSwgb3IgKGF0IHlvdXIgb3B0aW9uKSBhbnkgbGF0ZXIgdmVy
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
IEZvdW5kYXRpb24sIEluYy4sIDU5IFRlbXBsZSBQbGFjZSwgU3VpdGUgMzMwLCBCb3N0b24sIE1B
IDAyMTExLAouXCIgVVNBLgouXCIKLlRIIFNDQU5ESVJBVCAzIDIwMTEtMTEtMTUgIkxpbnV4IiAi
TGludXggUHJvZ3JhbW1lcidzIE1hbnVhbCIKLlNIIE5BTUUKc2NhbmRpcmF0IFwtIHNjYW4gYSBk
aXJlY3RvcnkgcmVsYXRpdmUgdG8gYSBkaXJlY3RvcnkgZmlsZSBkZXNjcmlwdG9yCi5TSCBTWU5P
UFNJUwoubmYKLkIgI2luY2x1ZGUgPGZjbnRsLmg+ICAgICAgICAgICAvKiBEZWZpbml0aW9uIG9m
IEFUXyogY29uc3RhbnRzICovCi5CICNpbmNsdWRlIDxkaXJlbnQuaD4KLnNwCi5maQouQkkgImlu
dCBzY2FuZGlyKGludCAiIGRpcmZkICIsIGNvbnN0IGNoYXIgKiIgZGlycCAiLCIKLkJJICJzdHJ1
Y3QgZGlyZW50ICoqKiIgbmFtZWxpc3QgLAoubmYKLlJTCi5CSSAiaW50ICgqIiBmaWx0ZXIgIiko
Y29uc3Qgc3RydWN0IGRpcmVudCAqKSwiCi5CSSAiaW50ICgqIiBjb21wYXIgIikoY29uc3Qgc3Ry
dWN0IGRpcmVudCAqKiwgY29uc3Qgc3RydWN0IGRpcmVudCAqKikpOyIKLlJFCi5maQouU0ggREVT
Q1JJUFRJT04KVGhlCi5CUiBzY2FuZGlyYXQgKCkKc3lzdGVtIGNhbGwgb3BlcmF0ZXMgaW4gZXhh
Y3RseSB0aGUgc2FtZSB3YXkgYXMKLkJSIHNjYW5kaXIgKDMpLApleGNlcHQgZm9yIHRoZSBkaWZm
ZXJlbmNlcyBkZXNjcmliZWQgaW4gdGhpcyBtYW51YWwgcGFnZS4KCklmIHRoZSBwYXRobmFtZSBn
aXZlbiBpbgouSSBkaXJwCmlzIHJlbGF0aXZlLCB0aGVuIGl0IGlzIGludGVycHJldGVkIHJlbGF0
aXZlIHRvIHRoZSBkaXJlY3RvcnkKcmVmZXJyZWQgdG8gYnkgdGhlIGZpbGUgZGVzY3JpcHRvcgou
SSBkaXJmZAoocmF0aGVyIHRoYW4gcmVsYXRpdmUgdG8gdGhlIGN1cnJlbnQgd29ya2luZyBkaXJl
Y3Rvcnkgb2YKdGhlIGNhbGxpbmcgcHJvY2VzcywgYXMgaXMgZG9uZSBieQouQlIgc2NhbmRpciAo
MykKZm9yIGEgcmVsYXRpdmUgcGF0aG5hbWUpLgoKSWYKLkkgZGlycAppcyByZWxhdGl2ZSBhbmQK
LkkgZGlyZmQKaXMgdGhlIHNwZWNpYWwgdmFsdWUKLkJSIEFUX0ZEQ1dEICwKdGhlbgouSSBkaXJw
CmlzIGludGVycHJldGVkIHJlbGF0aXZlIHRvIHRoZSBjdXJyZW50IHdvcmtpbmcKZGlyZWN0b3J5
IG9mIHRoZSBjYWxsaW5nIHByb2Nlc3MgKGxpa2UKLkJSIHNjYW5kaXIgKDMpKS4KCklmCi5JIGRp
cnAKaXMgYWJzb2x1dGUsIHRoZW4KLkkgZGlyZmQKaXMgaWdub3JlZC4KLlNIICJSRVRVUk4gVkFM
VUUiCk9uIHN1Y2Nlc3MsCi5CUiBzY2FuZGlyYXQgKCkKcmV0dXJucyB0aGUgbnVtYmVyIG9mIGRp
cmVjdG9yeSBlbnRyaWVzIHNlbGVjdGVkLgpPbiBlcnJvciwgXC0xIGlzIHJldHVybmVkIGFuZAou
SSBlcnJubwppcyBzZXQgdG8gaW5kaWNhdGUgdGhlIGVycm9yLgouU0ggRVJST1JTClRoZSBzYW1l
IGVycm9ycyB0aGF0IG9jY3VyIGZvcgouQlIgc2NhbmRpciAoMykKY2FuIGFsc28gb2NjdXIgZm9y
Ci5CUiBzY2FuZGlyYXQgKCkuClRoZSBmb2xsb3dpbmcgYWRkaXRpb25hbCBlcnJvcnMgY2FuIG9j
Y3VyIGZvcgouQlIgc2NhbmRpcmF0ICgpOgouVFAKLkIgRUJBREYKLkkgZGlyZmQKaXMgbm90IGEg
dmFsaWQgZmlsZSBkZXNjcmlwdG9yLgouVFAKLkIgRU5PVERJUgouSSBkaXJwCmlzIGEgcmVsYXRp
dmUgcGF0aCBhbmQKLkkgZGlyZmQKaXMgYSBmaWxlIGRlc2NyaXB0b3IgcmVmZXJyaW5nIHRvIGEg
ZmlsZSBvdGhlciB0aGFuIGEgZGlyZWN0b3J5LgouU0ggVkVSU0lPTlMKLkJSIHNjYW5kaXJhdCAo
KQp3YXMgYWRkZWQgdG8gZ2xpYmMgaW4gdmVyc2lvbiAyLjE1LgouU0ggIkNPTkZPUk1JTkcgVE8i
ClRoaXMgc3lzdGVtIGNhbGwgaXMgbm9uLXN0YW5kYXJkIGJ1dCBpcyBwcm9wb3NlZCBmb3IgaW5j
bHVzaW9uIGluIGEKZnV0dXJlIHJldmlzaW9uIG9mIFBPU0lYLjEuCi5TSCBOT1RFUwpTZWUKLkJS
IG9wZW5hdCAoMikKZm9yIGFuIGV4cGxhbmF0aW9uIG9mIHRoZSBuZWVkIGZvcgouQlIgc2NhbmRp
cmF0ICgpLgouU0ggIlNFRSBBTFNPIgouQlIgb3BlbmF0ICgyKSwKLkJSIHNjYW5kaXIgKDMpLAou
QlIgcGF0aF9yZXNvbHV0aW9uICg3KS4K
--=_a64c148867b1a0007617c55ecd014f65--

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
