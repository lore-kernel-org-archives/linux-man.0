Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97F9484223
	for <linux-man@vger.kernel.org>; Thu, 13 Aug 2026 14:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786632983; cv=none; b=sbnqODBbTI0jCkcU6d7nonNuIO5/Ej5coQpbYe1erBd1yH1P1whGpyy2v7CAVGW8iIi4b5sobTDCDqTcAGh69o8tZdVVC40KNVJdkyeSOAjH6DYc31s8fqG7rFfQtY1p3m37TpANLb8JycCuHGMdC2VbqOVqGdfIEE8tFSAsbN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786632983; c=relaxed/simple;
	bh=Xhm/Hi9cEPpjVV1zFwDTuSCmHFXTcIfIQk3KSEdMINE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VwYN4lFqCSZZygL0Xu6NynikEnaZnRcTl6bRDw/OxS4MALOVv7Elkd5/yrqHGXt0A8OKCxU70d+Po7qW2vH+c0OoDKXPLmZsQFtydfbB8431wUIYsdPXRj1slhr9JsFGhWWHMJrdZurYBNgM5yt4FRQ+pJISHyYPNsaj6c39FkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fqV0+RBM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fqV0+RBM"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 178A5C2BCF7
	for <linux-man@vger.kernel.org>; Thu, 13 Aug 2026 14:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786632983;
	bh=Xhm/Hi9cEPpjVV1zFwDTuSCmHFXTcIfIQk3KSEdMINE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=fqV0+RBMkebeFuR+SCWJS0iCVqJiG04XnD+yEdr3wHnTy/2LddSk6fCldKv8x/3jm
	 N+I9i25pHvffa7xvPrsCqPMLT2ERNVL8mz+I/c/6RAVJr+uvQfzD3Ih5RF6GzAzKwI
	 fj7anbgfVXfhKkEQnWQzmug/BfuGulA3TQP2zxoAzsvzaRT3TbXN5QXYsB8SBolC6C
	 sQYOsjzh8pfcqAkuaKeTNIONHFsCfaRfT6W8qFutILzpnGjCI5R+GgDXXdWfOcrKR1
	 H/2ZFe0aLwAqyVmrzOKqnNpLSf/MrBbx+M7mB3gPCMAfaIuCZ5D5/YJJvd1ts4sHBZ
	 b+3u39pKO4juQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id F170DC53BC5; Thu, 13 Aug 2026 14:56:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-man@vger.kernel.org
Subject: [Bug 221881] Documenting if both /dev/ptmx and /dev/pts/ptmx can be
 accessed at the same time.
Date: Thu, 13 Aug 2026 14:56:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo
 documentation_man-pages@kernel-bugs.osdl.org
X-Bugzilla-Product: Documentation
X-Bugzilla-Component: man-pages
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: alx@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: documentation_man-pages@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221881-11311-EiOtuVYxTj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221881-11311@https.bugzilla.kernel.org/>
References: <bug-221881-11311@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221881

--- Comment #1 from Alejandro Colomar (alx@kernel.org) ---
Hi Paolo,

> Date: 2026-08-13 14:20:33+0000
> From: bugzilla-daemon@kernel.org
>
> https://bugzilla.kernel.org/show_bug.cgi?id=3D221881
>=20
>             Bug ID: 221881
>            Summary: Documenting if both /dev/ptmx and /dev/pts/ptmx can be
>                     accessed at the same time.
>            Product: Documentation
>            Version: unspecified
>           Hardware: All
>                 OS: Linux
>             Status: NEW
>           Severity: low
>           Priority: P3
>          Component: man-pages
>           Assignee: documentation_man-pages@kernel-bugs.osdl.org
>           Reporter: dedo.paolo.24+linux@proton.me
>         Regression: No
>=20
> Traditionally pseudoterminals are created through the device file /dev/pt=
mx.
> With the introduction of the devpts virtual filesystem, new slave
> pseudoterminals are created through /dev/pts/ptmx device file and allocat=
ed
> in
> /dev/pts/*. In order to mantain backward compatibility, the device file
> /dev/ptmx has not been dropped byt instead requests to /dev/ptmx are
> forwarded
> to /dev/pts/ptmx.
>=20
> However, this is not preserved by bind mounts to /dev/ptmx: for example,
> after
> launching
>=20
> "# mount --bind /dev/ptmx /dev/ptmx"
>=20
> any attempt to opening /dev/ptmx will fail. Instead, bind mounting
> /dev/pts/ptmx works as expected (if devptsfs has previously been mounted =
with
> ptmxmode=3D0666). This is quite problematic if one wants to give access to
> /dev/ptmx inside a mount namespace. The solution provided in
> https://docs.kernel.org/filesystems/devpts.html is to remount devptsfs wi=
th
> the
> mount option ptmxmode=3D0666, then remove /dev/ptmx and finally place a b=
ind
> mount or a symlink pointing to /dev/pts/ptmx.
>=20
> The issues involving documentations are the following:
>=20
> 1. man 4 pts only describes the old interface /dev/ptmx and the newer def=
ice
> file /dev/pts/ptmx is never mentioned. /dev/pts/ptmx should at least be
> mentioned as an alternative for /dev/ptmx both to help software maintaine=
rs
> moving to the new interface and to provide access to pseudoterminals insi=
de
> mount namespaces;
>=20
> 2. nowhere inside the documentation is explained if it is safe to provide
> access to both /dev/ptmx and /dev/pts/ptmx at the same time. All provided
> scenarios give access to exactly one of /dev/ptmx and /dev/pts/ptmx device
> files. If we have to avoid giving full access to both /dev/ptmx and
> /dev/pts/ptmx through ptmxmode=3D0666 (to avoid race conditions) then it =
should
> be explicitly stated. On the contrary, a note that says there are no prob=
lems
> in giving full access to both these device files at the same time should =
be
> added.

If you know how to solve those issues, would you mind sending a patch?
If so, plese have a look at
<https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/tree/CONTRIBUT=
ING>
and
<https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/tree/CONTRIBUT=
ING.d/>.

If you don't know these, you could maybe ask through email to the kernel
maintainers of those features, and CC the linux-man@ mailing list, so we
learn that information.  (The links above will also help you.)


Have a lovely day!
Alex

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
