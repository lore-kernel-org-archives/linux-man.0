Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265F23C8C48
	for <linux-man@vger.kernel.org>; Fri,  3 Jul 2026 10:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783075851; cv=none; b=rV6IHeJumVmwexVzxUtkdxzfm+CZ31yPBc3KY3ZLNLf97O5N8ypAh+JM3oUezd8Pu3yVNfVpDbXM0QboaHXSyigsANR0B16P73tIGgo6mDos4UjItFEbwMB+r/2OIgRcoCJmwAm78PZwGW+OO7ZpXqi65seW9SdN24KcfK1lDs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783075851; c=relaxed/simple;
	bh=Me17IBommnwu53WQdPcV+eQL66+X0CEU9rm4bHQlhM8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Vo2kPFIfcVIV0nQWdRcWpwylQarnaJq5VcqVyNhISKig1iekdnIPWqo6rOret4/xa18z/FdTWNKxXtsQHbxx9IrJiBzU5CrCxRnxkFwIXzy2Dk4kBhQCJFHJZvVu0uRHoTYWeOGxbYDcew8GB27qLWy7H2xOEXCz9kaVo1M19wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UTwdtGht; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UTwdtGht"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C8929C2BCB9
	for <linux-man@vger.kernel.org>; Fri,  3 Jul 2026 10:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783075850;
	bh=Me17IBommnwu53WQdPcV+eQL66+X0CEU9rm4bHQlhM8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=UTwdtGhtSHxLVtVvUay8axRrhsM5liW/kJpvFOw5xR6wPr4TR9ei2cI2akHArwtBo
	 EMbWLJkJCFdZdwY0okRilWd4jpg8UV+TKDArMvBTwa0Oj6zk+8NVx5AB3t13CmGrFB
	 gyuiKrflLg6+gaxjUtBgHBC81apDHXZD7Q2RdczTwSdmHArl51vQWjzEOm/UeFY6bo
	 i4oiahhQhBY75YGoS+yX15CH1hDuuAu7FWSxWco57e43Lu7fLAN/3rmsCAi0TkHZxq
	 tQaZ9Xfv6Gz5vqGbo2thAeKQS+gbRj4fGpfS2mWvlTwKe4eUugVo6PWH481Vazy06m
	 RfY3F6Di7Heyw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AC3E2C41613; Fri,  3 Jul 2026 10:50:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-man@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjE3MTVdIOKAnG1ha2UgLVIgYnVpbGQtcGRmLXBhZ2Vz?=
 =?UTF-8?B?LXRyb2Zm4oCdIGZhaWxzIHdpdGgg4oCcd2FybmluZzogdGFibGUgcm93IGRv?=
 =?UTF-8?B?ZXMgbm90IGZpdOKAnQ==?=
Date: Fri, 03 Jul 2026 10:50:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo
 documentation_man-pages@kernel-bugs.osdl.org
X-Bugzilla-Product: Documentation
X-Bugzilla-Component: man-pages
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alx@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: documentation_man-pages@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221715-11311-gAyLbNplm8@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221715-11311@https.bugzilla.kernel.org/>
References: <bug-221715-11311@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D221715

--- Comment #1 from Alejandro Colomar (alx@kernel.org) ---
Hi Jason,

On 2026-07-03T00:13:12+0000, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D221715
>=20
>             Bug ID: 221715
>            Summary: =E2=80=9Cmake -R build-pdf-pages-troff=E2=80=9D fails=
 with =E2=80=9Cwarning:
>                     table row does not fit=E2=80=9D
>            Product: Documentation
>            Version: unspecified
>           Hardware: All
>                 OS: Linux
>             Status: NEW
>           Severity: normal
>           Priority: P3
>          Component: man-pages
>           Assignee: documentation_man-pages@kernel-bugs.osdl.org
>           Reporter: jason@jasonyundt.email
>         Regression: No
>=20
> Created attachment 310413
>   --> https://bugzilla.kernel.org/attachment.cgi?id=3D310413&action=3Dedit
> A full log of what happens when I follow the steps to reproduce on my sys=
tem
>=20
> Steps to reproduce:
>=20
> 1. Open a terminal.
>=20
> 2. Make sure that you have a copy of the man-pages repository on your sys=
tem.
>=20
> 3. Change directory into the root of the repository by running this comma=
nd:
>=20
>         cd <path to repository>
>=20
> 4. (Optional) Make sure that you=E2=80=99re using the same set of depende=
ncies that I
>    used when I tried building man-pages by doing the following:
>=20
>         A. Make sure that the Nix package manager is installed by running
>         this
>            command:
>=20
>                 nix-env --version
>=20
>            If that command finishes successfully, then Nix is installed. =
If
>            that command gives you an error, then you need to install Nix.
>=20
>         B. Activate a dev shell that contains all of the dependencies for
>            building man-pages by running this command:
>=20
>                 nix --extra-experimental-features 'nix-command flakes'
>                 develop
>
> 'git+https://codeberg.org/JasonYundt/flake-for-working-on-man-pages.git?r=
ef=3Drefs/heads/main&rev=3Dd3e76acfbb2f036aa9215e930b624f80813b7f3e'
>=20
> 5. (Optional) Switch to a revision of man-pages that is known to have this
> problem by running this command:
>=20
>         git switch --detach a12be0058be628f50da69fb0efb2ed9b4422a699
>=20
> 6. Attempt to build the =E2=80=9Cbuild-pdf-pages-troff=E2=80=9D target by=
 running this
> command:
>=20
>         make -R build-pdf-pages-troff
>=20
>=20
> When I follow those steps to reproduce on my system, the build fails with
> these
> errors:
>=20
> > .tmp/man/man4/console_codes.4:420: warning: table row does not fit on p=
age
> 5
> > .tmp/man/man4/console_codes.4:778: warning: table row does not fit on p=
age
> 9
> > make: ***
> >
> [/home/jayman/Documents/Home/VC/space_afraid/Git/partially_mine/man-pages=
/Repo/share/mk/build/pdf/pages/troff.mk:30:
> > .tmp/man/man4/console_codes.4.pdf.set] Error 1
> > make: *** Deleting file '.tmp/man/man4/console_codes.4.pdf.set'

Yup; I'm not an expert in these things.  I've CCd BRanden, who knows
more groff(7) than I, and maybe he could send patches to have a clean
build.

Branden, would you mind having a look at `make -R build-pdf` and send
patches to fix the diagnostics we get?  It would also be nice to try
build-ps and build-html.


Have a lovely day!
Alex

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
