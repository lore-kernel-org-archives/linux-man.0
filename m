Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B105C38D
	for <linux-man@vger.kernel.org>; Fri,  3 Jul 2026 00:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783037593; cv=none; b=VdkyHW1lsxMznT5GAyGtTp/XRGyS5BAeHKeKm9bl7QYFtGoyIAdpZ5sljH+GCsOuoTmsViaheo1ivuL3JLne14Xsjyj/R2PW/mwP4JFamppEUIc5TeBqhCEnQzCjgU646BgExecVQrU1RMSzm2GHP/bLqFo4++mr5pKheqZ/HuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783037593; c=relaxed/simple;
	bh=F2qn1/byUMKgo7zissRmPnvBKz2PjF+TASyVGLABrvw=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=qgETpQv5Oa7yt6558XjU9zrt3nDamgiU5xeP96ALo8z/jnQcSNEQeDs5tgdKPa7JH1JXui1uzsFKbru11KTbauFB0Fi/gAE/SlyYawZTEz922Vj+B7/YEm8k0eWFwppA6bbcd+iMdkLBLgnjgVyQVaGg77TV47lIF/7/DzaxYmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jO5BzADj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jO5BzADj"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 35832C2BCF5
	for <linux-man@vger.kernel.org>; Fri,  3 Jul 2026 00:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783037593;
	bh=F2qn1/byUMKgo7zissRmPnvBKz2PjF+TASyVGLABrvw=;
	h=From:To:Subject:Date:From;
	b=jO5BzADjAPf0vAr6fmIUpqGcl+xvLbtZMsyjf7cij9bmclW1iegO1sccM046wHhVO
	 lYSnxLewxlSPiNPHmBEIg1Cp4fhJoWjsnjO9hNH6yX8WKA3Hc2XazKxutHaQO+Za5M
	 ols8Yk4u65uvrj/Z76qQtY3c1mpGQa7+DBmlwkigvTMATPqyrKJehK9NQU4xgUCZzS
	 Cla5FYqXg4/DESoUzgexAAbMXp/fylcLUs3/5Ox5RDm57n+fraiOGTfVQvdF0sxntt
	 wYWU74TnuL3vfFVIRaIcFKySAeC6ic4660SuCH7F+qwqoJ+1KLC6nhkfS9x1z56gDE
	 NKse3dcn8PBWQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1A718C41612; Fri,  3 Jul 2026 00:13:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-man@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjE3MTVdIE5ldzog4oCcbWFrZSAtUiBidWlsZC1wZGYt?=
 =?UTF-8?B?cGFnZXMtdHJvZmbigJ0gZmFpbHMgd2l0aCDigJx3YXJuaW5nOiB0YWJsZSBy?=
 =?UTF-8?B?b3cgZG9lcyBub3QgZml04oCd?=
Date: Fri, 03 Jul 2026 00:13:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo
 documentation_man-pages@kernel-bugs.osdl.org
X-Bugzilla-Product: Documentation
X-Bugzilla-Component: man-pages
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jason@jasonyundt.email
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: documentation_man-pages@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-221715-11311@https.bugzilla.kernel.org/>
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

            Bug ID: 221715
           Summary: =E2=80=9Cmake -R build-pdf-pages-troff=E2=80=9D fails w=
ith =E2=80=9Cwarning:
                    table row does not fit=E2=80=9D
           Product: Documentation
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: man-pages
          Assignee: documentation_man-pages@kernel-bugs.osdl.org
          Reporter: jason@jasonyundt.email
        Regression: No

Created attachment 310413
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310413&action=3Dedit
A full log of what happens when I follow the steps to reproduce on my system

Steps to reproduce:

1. Open a terminal.

2. Make sure that you have a copy of the man-pages repository on your syste=
m.

3. Change directory into the root of the repository by running this command:

        cd <path to repository>

4. (Optional) Make sure that you=E2=80=99re using the same set of dependenc=
ies that I
   used when I tried building man-pages by doing the following:

        A. Make sure that the Nix package manager is installed by running t=
his
           command:

                nix-env --version

           If that command finishes successfully, then Nix is installed. If
           that command gives you an error, then you need to install Nix.

        B. Activate a dev shell that contains all of the dependencies for
           building man-pages by running this command:

                nix --extra-experimental-features 'nix-command flakes' deve=
lop
'git+https://codeberg.org/JasonYundt/flake-for-working-on-man-pages.git?ref=
=3Drefs/heads/main&rev=3Dd3e76acfbb2f036aa9215e930b624f80813b7f3e'

5. (Optional) Switch to a revision of man-pages that is known to have this
problem by running this command:

        git switch --detach a12be0058be628f50da69fb0efb2ed9b4422a699

6. Attempt to build the =E2=80=9Cbuild-pdf-pages-troff=E2=80=9D target by r=
unning this command:

        make -R build-pdf-pages-troff


When I follow those steps to reproduce on my system, the build fails with t=
hese
errors:

> .tmp/man/man4/console_codes.4:420: warning: table row does not fit on pag=
e 5
> .tmp/man/man4/console_codes.4:778: warning: table row does not fit on pag=
e 9
> make: ***
> [/home/jayman/Documents/Home/VC/space_afraid/Git/partially_mine/man-pages=
/Repo/share/mk/build/pdf/pages/troff.mk:30:
> .tmp/man/man4/console_codes.4.pdf.set] Error 1
> make: *** Deleting file '.tmp/man/man4/console_codes.4.pdf.set'

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
