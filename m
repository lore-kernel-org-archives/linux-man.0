From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Subject: Re: [PATCH] man7/mdoc_samples.7: srcfix: Avoid a warning
 about a wrong section
Date: Thu, 28 Feb 2019 01:10:12 +1100
Message-ID: <20190227141010.youfrarlqqinm5uj@crack.deadbeast.net>
References: <20190216180340.GA7407@rhi.hi.is>
	<7a5597f7-2c4e-95ca-2eb5-20369a5857cb@gmail.com>
	<20190227094847.bkasny3d4obp2n25@crack.deadbeast.net>
	<CAKgNAki-xLaZuHK4By6+8Cvt70iv8BXqaQcm-yjoEJjHYissYg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hr3bcrfrf7ddq6qm"
Return-path: <groff-bounces+gcpgg-help-groff=m.gmane.org@gnu.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAki-xLaZuHK4By6+8Cvt70iv8BXqaQcm-yjoEJjHYissYg@mail.gmail.com>
List-Unsubscribe: <https://lists.gnu.org/mailman/options/groff>,
	<mailto:groff-request@gnu.org?subject=unsubscribe>
List-Archive: <http://lists.gnu.org/archive/html/groff/>
List-Post: <mailto:groff@gnu.org>
List-Help: <mailto:groff-request@gnu.org?subject=help>
List-Subscribe: <https://lists.gnu.org/mailman/listinfo/groff>,
	<mailto:groff-request@gnu.org?subject=subscribe>
Errors-To: groff-bounces+gcpgg-help-groff=m.gmane.org@gnu.org
Sender: "groff" <groff-bounces+gcpgg-help-groff=m.gmane.org@gnu.org>
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc: linux-man <linux-man@vger.kernel.org>, groff@gnu.org
List-Id: linux-man@vger.kernel.org


--hr3bcrfrf7ddq6qm
Content-Type: multipart/mixed; boundary="dmrneyotxfd5jwrl"
Content-Disposition: inline


--dmrneyotxfd5jwrl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

At 2019-02-27T13:37:46+0100, Michael Kerrisk (man-pages) wrote:
> So, summary: should I apply Bjarni's patch? Or does this lead to
> back-compatibility problems?

For maximum back-compatibility, you'd leave all of the string defines
(.ds requests) active and uncommented.

Zooming out a little bit, it appears that the proposed patch may be
getting layered on top of an _earlier_ patch to shut up warnings from
the macro package while rendering mdoc.samples(7).

Looking at the patch once again, and noting the context, I see three
workarounds in a row, first pushed and then popped.

--- a/man7/mdoc.samples.7
+++ b/man7/mdoc.samples.7
@@ -1668,11 +1668,11 @@ will generate the following text:
 .Pp
 .\" fake section 3 to avoid error message from Rv
 .\".ds cH 3
-.ds section 3
+.ds doc-section 3
 .Rv -std atexit
 .\" and back to 7 again
 .\".ds cH 7
-.ds section 7
+.ds doc-section 7
 .Pp
 The
 .Fl std

The warning in question is this:

Usage: .Rv -std in sections 2 and 3 only (#1672)

I'm starting to think the correct thing to do here is to see how we can
get the page to render correctly without having to define strings at
all.  Or, as Ingo suggested, drop the page altogether.

The purpose of the mdoc macro ".Rv" is to document a function's return
value.  I've attached groff's implementation of this macro for the
curious.

The macro complains if it's called from a page that isn't in the two
sections set aside for documenting function interfaces (2 and 3).  Being
a gallery of examples, the page is trying to trick .Rv into not spewing
a diagnostic message by using insider knowledge of the test .Rv
implements to determine whether it should emit one.  This is going to be
a fragile thing, hence the 3 different strings that have been used for
the purpose: "doc-section" (unstripped groff_mdoc, groff 1.22.4),
"section" (stripped groff_mdoc, groff 1.22.3 and earlier), and "cH" (no
idea).

While I consider myself competent in man(7), I defer to Ingo's expertise
on mdoc(7)[1].  But I don't think any of the above--the commented out
.ds, the old (-) one, or the new (+)--is a model solution for resolving
what .Rv is complaining about.

Therefore my suggestion is to either live with the warning, chopping out
_all_ these .ds kludges from the page--leaving one comment noting the
warning we expect--or to drop the page altogether.

Regards,
Branden

[1] As I have said elsewhere, I admire mdoc's goals and design--it is
semantically-oriented, which man(7) very badly is not.  Unfortunately I
find mdoc unergonomic due in part to its self-restriction to the
two-character macro namespace of legacy *roff implementations, which in
my opinion makes the language too hard to acquire, especially for the
occasional user.  And most man page writers are only occasional users.
(I have other complaints about mdoc's documentation and pedagogy, but I
will leave them for another discussion.)

--dmrneyotxfd5jwrl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="mdoc_rv_impl.tmac"

.\" NS Rv user macro
.\" NS   return values
.\" NS
.\" NS width register 'Rv' set in doc-common
.\" NS
.\" NS local variables:
.\" NS   doc-str-Rv-std-prefix
.\" NS   doc-str-Rv-std-suffix
.\" NS   doc-str-Rv-stds-prefix
.\" NS   doc-str-Rv-stds-and
.\" NS   doc-str-Rv-stds-suffix
.\" NS   doc-str-Rv-std0
.
.ds doc-str-Rv-std-prefix "The
.ds doc-str-Rv-std-suffix "function returns the value\~0 if successful;
.as doc-str-Rv-std-suffix " otherwise the value\~\-1 is returned and
.as doc-str-Rv-std-suffix " the global variable \*[doc-Va-font]errno\f[]
.as doc-str-Rv-std-suffix " is set to indicate the error.
.
.ds doc-str-Rv-stds-prefix "The
.ds doc-str-Rv-stds-and    "and
.ds doc-str-Rv-stds-suffix "functions return the value\~0 if successful;
.as doc-str-Rv-stds-suffix " otherwise the value\~\-1 is returned and
.as doc-str-Rv-stds-suffix " the global variable \*[doc-Va-font]errno\f[]
.as doc-str-Rv-stds-suffix " is set to indicate the error.
.
.ds doc-str-Rv-std0 "Upon successful completion, the value\~0 is returned;
.as doc-str-Rv-std0 " otherwise the value\~\-1 is returned and
.as doc-str-Rv-std0 " the global variable \*[doc-Va-font]errno\f[]
.as doc-str-Rv-std0 " is set to indicate the error.
.
.de Rv
.
.\" XXX: what does this function without '-std'?
.
.  if \n[doc-arg-limit] \{\
.    tm Usage: .Rv not callable by other macros (#\n[.c])
.    doc-reset-args
.    return
.  \}
.
.  if !\n[.$] \{\
.    tm Usage: .Rv [-std] [<function> ...] (#\n[.c])
.    return
.  \}
.
.  if "\$1"-std" \{\
.    nr doc-reg-Rv \*[doc-section]
.    if ((\n[doc-reg-Rv] < 2) : (\n[doc-reg-Rv] > 3)) \
.      tm Usage: .Rv -std in sections 2 and 3 only (#\n[.c])
.    br
.    shift
.    ie (\n[.$] > 1) \{\
.      nop \)\*[doc-str-Rv-stds-prefix]
.      nr doc-reg-Rv 1
.      while (\n[doc-reg-Rv] < \n[.$]) \{\
.        ie (\n[.$] > 2) \
.          Fn \$\n[doc-reg-Rv] ,
.        el \
.          Fn \$\n[doc-reg-Rv]
.        nr doc-reg-Rv +1
.      \}
.      nop \)\*[doc-str-Rv-stds-and]
.      Fn \$\n[.$]
.      nop \)\*[doc-str-Rv-stds-suffix]
.    \}
.    el \{ .ie (\n[.$] == 1) \{\
.      nop \)\*[doc-str-Rv-std-prefix]
.      Fn \$1
.      nop \)\*[doc-str-Rv-std-suffix]
.    \}
.    el \{\
.      nop \)\*[doc-str-Rv-std0]
.  \}\}\}
..

--dmrneyotxfd5jwrl--

--hr3bcrfrf7ddq6qm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAlx2mjgACgkQ0Z6cfXEm
bc70hhAAnQj5hgKEVcc2hG4YMSWO0Chqnlx6btKGuegeuCDLs+aocAy7CdUSKOx3
if8zra0/vU5woXaev+KRzHqYyyf4+aYNnLYfae7Lo8te0H8gpA6GnXPcmP2NBsnl
ns5HsrYkE+FofnWx1esLkburrDAQnEnCUlAvbigXS88P7BkHCe611vWeVdXpziLq
6wRu5CR/l0i884RxEEtwx7UsrcpRwLhENwj8fYSHjreQVHLqK8/UNSW0TWFrx98W
xzzZiZMowWretAwCiHuqiBM20yCdyE95eSoNpfILsFxa6dAaIiQwJscy6+37lKc6
OkkIAywfd93/NL9dR/ig0BE6bZMTz0gBeQbCLUy3d0aoEET2Byb33rgq/Dq/qAUD
6SKMRy4g5ZlPlkapS5FCd8coUMlDPz1hv2NOrpR0UrnqoumoQTwV55EdGeEvQEZo
XlTepAuQvK5M1mxz/ZSM8ySalP/BblwFhkdPl6t+sLhtPXHA5dmPSiPzuNNtCec8
muDlUF+jCRqjG6UV1c8ufE8BUZjw/77dSji38Zf/FLYZKx/9NpskGwS2wxf8u9lW
8e5SybG4Ly4xGrgy42+kZCROMAMLkhao666pliEYxdPi+9nDDo38+gje2jvlz0Ap
aAdGO8lEmG+k9PS1GEaP6OLQnVNEhUL01J3NfTrjLbTtlQro0zU=
=ruYg
-----END PGP SIGNATURE-----

--hr3bcrfrf7ddq6qm--
