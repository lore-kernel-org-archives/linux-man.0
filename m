Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C0141D65E
	for <linux-man@vger.kernel.org>; Sat, 29 Aug 2026 21:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788037490; cv=none; b=jAOlSaA6ho+IJ9Wj6eU1WLKU6yb5eFwW3URyR44DQE1xrZoqk2YFY6/cr/vZnXqQzFrtkOEhe9yfcoAS1oy4r+evdf/7wdJDI5b6uiyJ8WDmrhIi1EegOklPbuZCzGNDHJ+Js8YANHdgPTiERb09Upd4az0HLDjj8ujQteWvYs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788037490; c=relaxed/simple;
	bh=7/2n/Jq8VqPAjr0t6OuokKyXN28pHEiKSY8wrz5dkeI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lDZF8d/pMAN71sNZyLWC8jA0dcCHXT9yUGTX4TJVHX/4lxzV5PE0VMCWpzM9gf8OrK7EYwRJvyAVtYqlrTTvR4Oiv5J2KjZC5fOJp2yh8JAaljEmIvAzdPlE4sXZ8wItLXFLWGvTXfKlW7umrn0gWoRfTbaZ1Mdtw3zZbB/Dxos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F3iUNH2K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F3iUNH2K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BF071F000E9;
	Sat, 29 Aug 2026 21:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788037487;
	bh=r+HrP2/Uc0OqfPCXxt5/37Pbz4SRgYFgs7VJ6AuVrxc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F3iUNH2KM5BfvC/OusidQxxeDYLdqhwwi8d3YE76+f1DHYIqp9rpvjUQ6H+zwYxPz
	 nuqfLz0vH+cO5J/scPDTbnt47RC+3YVyENY18ZWJHx7TrekX5BKapbtbS8byK6Zu7E
	 RwFv9kzKLoZncsrOSgzpEIXcIn6TIhd7R8JOJrUb/h0/ZZhEHJ99bVNiN5u3HTsDeo
	 tDmYwSortQ23spfKuu3EbfQ/7m1KiVuY+Ij78QdzqyTk/qoEGLqKWRBj6OWHrqIlIz
	 xF2C02YrhlUQS6P033l3kr7DiE9R9YWTov7J+y7NE0LEoGY42d8B4c6854TFc0qS1O
	 hKVW0Pz8qRveA==
Date: Sat, 29 Aug 2026 23:04:44 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Tingmao Wang <m@maowtm.org>
Cc: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
	=?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>, linux-man@vger.kernel.org
Subject: Re: [PATCH] landlock.7, landlock_*.2: Document
 LANDLOCK_ADD_RULE_QUIET
Message-ID: <apL7kYQ9Iu_4F59K@devuan>
References: <20260829145209.98783-1-m@maowtm.org>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nqwlhubbfbwmexz2"
Content-Disposition: inline
In-Reply-To: <20260829145209.98783-1-m@maowtm.org>


--nqwlhubbfbwmexz2
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Tingmao Wang <m@maowtm.org>
Cc: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
	=?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>, linux-man@vger.kernel.org
Subject: Re: [PATCH] landlock.7, landlock_*.2: Document
 LANDLOCK_ADD_RULE_QUIET
Message-ID: <apL7kYQ9Iu_4F59K@devuan>
References: <20260829145209.98783-1-m@maowtm.org>
MIME-Version: 1.0
In-Reply-To: <20260829145209.98783-1-m@maowtm.org>

Hi Tingmao,

> Date: 2026-08-29 15:52:07+0100
> From: Tingmao Wang <m@maowtm.org>
>
> LANDLOCK_ADD_RULE_QUIET is a new feature introduced in Landlock ABI
> version 10, merged in kernel v7.2 [1].  This patch copies relevant
> kernel documentation into man-pages.
>=20
> Link: <https://patch.msgid.link/cover.1781228815.git.m@maowtm.org/> [1]
> Signed-off-by: Tingmao Wang <m@maowtm.org>
> ---
>=20
> Hi,
>=20
> For context, I'm the author of the quiet flag feature and this is my
> first man-pages patch.  @G=C3=BCnther or @Micka=C3=ABl, can one of you do=
 a quick review?
>=20
> All text in this patch is copied from the kernel source except this
> bit:
>     .TP
>     .B EINVAL
>     .I flags
>     is not 0 or one of the allowed values.
>=20
> (the kernel says "%EINVAL: @flags is not valid", I decided to make it
> more precise)
>=20
>  man/man2/landlock_add_rule.2       | 46 ++++++++++++++++++++++++++--
>  man/man2/landlock_create_ruleset.2 | 48 ++++++++++++++++++++++++++++++
>  man/man7/landlock.7                | 27 +++++++++++++++++
>  3 files changed, 118 insertions(+), 3 deletions(-)
>=20
> diff --git a/man/man2/landlock_add_rule.2 b/man/man2/landlock_add_rule.2
> index fe01a98d9..7b5a41161 100644
> --- a/man/man2/landlock_add_rule.2
> +++ b/man/man2/landlock_add_rule.2
> @@ -120,7 +120,43 @@ .SH DESCRIPTION
>  and it will automatically translate to binding on the related port range.
>  .P
>  .I flags
> -must be 0.
> +can either be 0 or contain:

What do you mean by 'contain'?  Is it a bit mask?  Or an exact value?

> +.TP
> +.BR LANDLOCK_ADD_RULE_QUIET "  (since Landlock ABI version 10)"
> +Together with the
> +.I quiet_*

The '*' should be in roman.  The variable part of a word should be in
italics except when the rest is already in italics, in which case it
is in roman.  Thus:

	.IR quiet_ *

> +fields in
> +.IR "struct landlock_ruleset_attr" ,

Let's follow conventions in that page:

	.IR \%struct\~landlock_ruleset_attr ,

The '\%' makes sure there's no hyphenation, and the '\~' is a
non-breaking space (of adjustable width).  Since there's no space, the
quotes become unnecessary.

> +this flag controls whether Landlock will log audit messages when
> +access to the objects covered by this rule is denied by this layer.
> +.IP
> +If logging is enabled, when Landlock denies an access,

Please break the line after the first comma too.

> +it will suppress the log if all of the following are true:
> +.RS
> +.IP \[bu] 3
> +this layer is the innermost layer that denied the access;
> +.IP \[bu]
> +all accesses denied by this layer are part of the
> +.I quiet_*

IR and a space, as above.

> +fields in the related
> +.IR "struct landlock_ruleset_attr" ;

\% and \~, as above.

> +.IP \[bu]
> +the object (or one of its parents, for filesystem rules) is

Please break the line after the closing parenthesis, not after 'is'.
I'd also break before the opening parenthesis.

> +marked as "quiet" via
> +.BR LANDLOCK_ADD_RULE_QUIET .
> +.IP
> +Because logging is only suppressed by a layer if the layer denies
> +access,

Please use semantic newlines.  See man-pages(7):

	$ MANWIDTH=3D64 man man-pages | awk '/Use semantic newlines/,/^$/'
	   Use semantic newlines
	     In  the  source  of a manual page, new sentences should be
	     started on new lines, long sentences should be split  into
	     lines at clause breaks (commas, semicolons, colons, and so
	     on),  and  long  clauses  should be split at phrase bound=E2=80=90
	     aries.  This convention, sometimes known as "semantic new=E2=80=90
	     lines", makes it easier to  see  the  effect  of  patches,
	     which  often operate at the level of individual sentences,
	     clauses, or phrases.

That is, please break the line before 'if', not after 'denies'.

> +a sandboxed program cannot use this flag to "hide" access denials,
> +without denying itself the access in the first place.
> +.IP
> +The effect of this flag does not depend on the value of
> +.I allowed_access
> +in the passed in
> +.IR rule_attr .
> +When this flag is present, the caller is also allowed to pass in an
> +empty

Please break after the comma, not after 'an'.

> +.IR allowed_access .
>  .SH RETURN VALUE
>  On success,
>  .BR landlock_add_rule ()
> @@ -159,7 +195,7 @@ .SH ERRORS
>  .TP
>  .B EINVAL
>  .I flags
> -is not 0.
> +is not 0 or one of the allowed values.

0 is an allowed value, technically.  :)

>  .TP
>  .B EINVAL
>  The rule accesses are inconsistent (i.e.,
> @@ -180,11 +216,15 @@ .SH ERRORS
>  In
>  .IR \%struct\~landlock_net_port_attr ,
>  the port number is greater than 65535.
> +.TP EINVAL
> +.B LANDLOCK_ADD_RULE_QUIET
> +is passed but the ruleset has no quiet access bits set for the
> +corresponding rule type.

Please break after 'passed' and after 'set', bot not after 'the'.

>  .TP
>  .B ENOMSG
>  Empty accesses (i.e.,
>  .I rule_attr\->allowed_access
> -is 0).
> +is 0) and no flags.

Please break the line after the closing parenthesis.

>  .TP
>  .B EOPNOTSUPP
>  Landlock is supported by the kernel but disabled at boot time.
> diff --git a/man/man2/landlock_create_ruleset.2 b/man/man2/landlock_creat=
e_ruleset.2
> index 2a33fa4b5..8611e3aba 100644
> --- a/man/man2/landlock_create_ruleset.2
> +++ b/man/man2/landlock_create_ruleset.2
> @@ -45,6 +45,9 @@ .SH DESCRIPTION
>      __u64 handled_access_fs;
>      __u64 handled_access_net;
>      __u64 scoped;
> +    __u64 quiet_access_fs;
> +    __u64 quiet_access_net;
> +    __u64 quiet_scoped;
>  };
>  .EE
>  .in
> @@ -70,6 +73,17 @@ .SH DESCRIPTION
>  in
>  .BR landlock (7)).
>  .IP
> +.I quiet_access_fs
> +is a bitmask of filesystem actions which should not be logged if

Please say 'bit mask' instead of bitmask.  See man-pages(7):

   Preferred terms
     The  following  table lists some preferred terms to use in
     man pages, mainly to ensure consistency across pages.
     Term                 Avoid using              Notes
     =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80
     bit mask             bitmask


> +per-object quiet flag is set.

Please break the line before 'if', not after.

> +.IP
> +.I quiet_access_net
> +is a bitmask of network actions which should not be logged if
> +per-object quiet flag is set.

Same.

> +.IP
> +.I quiet_scoped
> +is a bitmask of scoped actions which should not be logged.

In general, the idea is that there should be symmetry in the way text
is written.  This last paragraph is an excellent example of how the
last part 'if ...' is a separate clause in the sentence, and thus
deserves to be in a line of its own.

> +.IP
>  This structure defines a set of
>  .IR "handled access rights" ,
>  a set of actions on different object types,
> @@ -100,6 +114,29 @@ .SH DESCRIPTION
>  a wide range or all access rights that they know about at build time
>  (and that they have tested with a kernel that supported them all).
>  .IP
> +.I quiet_access_fs
> +and
> +.I quiet_access_net
> +are bitmasks of actions for which a denial by this layer will not

Break after 'layer'.

> +trigger a log if the corresponding object (or its children, for

Break after 'log'.

> +filesystem rules) is marked with the "quiet" bit via

Break after ')'.

> +.BR LANDLOCK_ADD_RULE_QUIET ,
> +even if logging would normally take place per
> +.BR landlock_restrict_self (2)
> +flags.
> +.I quiet_scoped
> +is similar, except that it does not require marking any objects as quiet

Break after ','.

> +-

Please avoid '-', since it makes it harder to parse the end of the
sentence.  Parentheses create an enclosing that makes it easier to parse
the structure of the sentence.

> +if the ruleset is created with any bits set in
> +.IR quiet_scoped ,
> +then denial
> +of such scoped resources will not trigger any log.
> +These 3 fields are available since Landlock ABI version 10
> +(see
> +.B Quiet rule flag
> +in
> +.BR landlock (7)).
> +.IP
>  This structure can grow in future Landlock versions.
>  .P
>  .I size
> @@ -204,6 +241,17 @@ .SH ERRORS
>  or
>  .BR LANDLOCK_CREATE_RULESET_ERRATA .
>  .TP
> +.B EINVAL
> +.IR quiet_access_fs ,
> +.IR quiet_access_net ,
> +or
> +.I quiet_scoped
> +is not a subset of the corresponding
> +.IR handled_access_fs ,
> +.IR handled_access_net ,
> +or
> +.IR scoped .
> +.TP
>  .B ENOMSG
>  Empty accesses (i.e.,
>  .I attr
> diff --git a/man/man7/landlock.7 b/man/man7/landlock.7
> index 880dd5058..1d2fa5ef6 100644
> --- a/man/man7/landlock.7
> +++ b/man/man7/landlock.7
> @@ -456,6 +456,31 @@ .SS Truncating files
>  It is also possible to pass such file descriptors between processes,
>  keeping their Landlock properties,
>  even when these processes do not have an enforced Landlock ruleset.
> +.SS Quiet rule flag
> +Starting with the Landlock ABI version 10,
> +it is possible to selectively suppress logs for specific denied

Break after 'logs'.

> +accesses on a per-object basis with the

Break after 'accesses'.

> +.B LANDLOCK_ADD_RULE_QUIET
> +flag of
> +.BR landlock_add_rule (2),
> +in combination with the
> +.B quiet_access_fs
> +and
> +.B quiet_access_net
> +fields
> +of
> +.IR "struct landlock_ruleset_attr" .

\% and \~ as before.

> +It is also now possible to suppress
> +logs for scope accesses via the

Break after 'logs', not before.

> +.B quiet_scoped
> +field of
> +.IR "struct landlock_ruleset_attr" .
> +The object is marked as quiet within a ruleset when at least one
> +.BR landlock_add_rule (2)
> +call is made for it with the
> +.B LANDLOCK_ADD_RULE_QUIET
> +flag, additional add-rule calls for the same object without this flag

Break after the comma too (the current line break is good).

> +do not clear it.
>  .SH VERSIONS
>  Landlock was introduced in Linux 5.13.
>  .P
> @@ -500,6 +525,8 @@ .SH VERSIONS
>  8	7.0	LANDLOCK_RESTRICT_SELF_TSYNC
>  _	_	_
>  9	7.1	LANDLOCK_ACCESS_FS_RESOLVE_UNIX
> +_	_	_
> +10	7.2	LANDLOCK_ADD_RULE_QUIET
>  .TE
>  .P
>  Users should use the Landlock ABI version rather than the kernel version
> --=20
> 2.55.0
>=20

Have a lovely night!
Alex

--=20
<https://www.alejandro-colomar.es>

--nqwlhubbfbwmexz2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmqTSWYACgkQ64mZXMKQ
wqm/xw/+OZ7tEI3QfPmTQQRPZRoKguw5uTW8Y3wngD19Pf2PeEGGe+nkbOrng7u3
vOEH/YMDvOYjr4anaMtW++Cf+UPf2xeV8n/6xyFr/9CrnTygHMtXUjvESixDTgBA
5636jMrjWnmvncKd24ozaCimUbQmSS/dkPOL3Ize6rv54ULalHynptYPAkoVNMGK
ECZxFrZnuJehjm78tSxgjFy8DAwlGsk5fR67KpZhiak2Y765GedyN9Q/7uCpWa7T
5+K04GTsCDONPpqCaVKhNfjy+PHwx/z13vfjFPSkECFVTW2rxwqStR7/nW+AxRKe
mvYcZeC/IL5SKHGZ7umkTgiMSa8+1RDXpYGznqymQE+YkywKBPJBpEwzr5EMo9kh
CtlkL6KXL8YFEgyte/a0o9DmvE4QUcofClvdxqR2fH3XBUUrLuwvYHRwf660VwdW
UQEC+VQ6ieVfT7uVTcIVYmrAYU1UAZXswlFPxEsLAPzRE2LcdIVrxob63vKzZtIJ
cQjyRsWKjVDMrEN5tR6RlKLkmkLcWMI3QJKYJk5MKl/ZrqUB85TTVguIRFyuHsYi
QlZjPzKWO/Az/Z8Tv1HMg5R60F9a4SSpJ50VO8u+3csC65fmi29LuQOLSfS5ub/z
MNAAGOPHTXpAwCxvLrAJdNwnh/jmFDUogpoqz7Y2kgj5XaaF/28=
=1u1E
-----END PGP SIGNATURE-----

--nqwlhubbfbwmexz2--
