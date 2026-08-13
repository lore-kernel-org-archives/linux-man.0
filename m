Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC10932BF4B
	for <linux-man@vger.kernel.org>; Thu, 13 Aug 2026 14:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786630833; cv=none; b=QE7NuanL3+c2/shlWrGXQyGc8kdLonZZGrwqlUNVR9IPqCsgPLKiEj8F/bgvvNuTkLZO/LLBAj+DxscbH2u96dJJKrxr/KPP8MQ7opjLS0/xewns3WlBP1AzDUy/aAYZmeuvgSUyRjoZFAFocCncgUmD296cw+piCIVImqrGfPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786630833; c=relaxed/simple;
	bh=QDAJzSUF31Wjyt4e53TGfH1Pp+8Y8mcwOo17cLTfw9I=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=pG1Ak3JmbCoA6bPo2adJFgoaPOgRikAJoxyqYmAhGd6Wzek22XoOTDliBNUWU87s96QzS/uPsxo9V9jcKc/tyoGxQHWOcuUz/F2qKHIkqItPwwSUJzoThqTQR1Urf4QWSQsFCkO+FJDyAcG2hYH7w5DVfqo7KHUBg4AhXGgyF98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hMEh2xTu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hMEh2xTu"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 65085C2BCF4
	for <linux-man@vger.kernel.org>; Thu, 13 Aug 2026 14:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786630833;
	bh=QDAJzSUF31Wjyt4e53TGfH1Pp+8Y8mcwOo17cLTfw9I=;
	h=From:To:Subject:Date:From;
	b=hMEh2xTupSIuGo0aXTXs6fDtZIZ7goVNGFHHauqlefie89SQyJz4R3ShN/h/Gt1KY
	 Cf+tI2nuRbTojWnOBGagwopvpSOTZ2Fu9PmmEVPyyTdcQEALXl7bPTGwl8HkTLLjst
	 cYVvNN+QmSkWh31VA6QFE/Gz9twwjeupZ97aRNtos4bv35YKHBcN1G++HFMCy/mzGl
	 Rvm/tNejfx7HjwOEt+vqeRifbjyzWjzTtw7TfBK8H6vT+YfV2kI2i1Q9rb5kX6BCYu
	 Biye9gCVA/saghVMs9GixUTyiNYDdQLIcu+9kE1MfDJWuhCnG9iLXqPnVZBjO+nrnH
	 +/Jixy4HkhuWQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 491CCC41612; Thu, 13 Aug 2026 14:20:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-man@vger.kernel.org
Subject: [Bug 221881] New: Documenting if both /dev/ptmx and /dev/pts/ptmx
 can be accessed at the same time.
Date: Thu, 13 Aug 2026 14:20:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo
 documentation_man-pages@kernel-bugs.osdl.org
X-Bugzilla-Product: Documentation
X-Bugzilla-Component: man-pages
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: dedo.paolo.24+linux@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: documentation_man-pages@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-221881-11311@https.bugzilla.kernel.org/>
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

            Bug ID: 221881
           Summary: Documenting if both /dev/ptmx and /dev/pts/ptmx can be
                    accessed at the same time.
           Product: Documentation
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: low
          Priority: P3
         Component: man-pages
          Assignee: documentation_man-pages@kernel-bugs.osdl.org
          Reporter: dedo.paolo.24+linux@proton.me
        Regression: No

Traditionally pseudoterminals are created through the device file /dev/ptmx.
With the introduction of the devpts virtual filesystem, new slave
pseudoterminals are created through /dev/pts/ptmx device file and allocated=
 in
/dev/pts/*. In order to mantain backward compatibility, the device file
/dev/ptmx has not been dropped byt instead requests to /dev/ptmx are forwar=
ded
to /dev/pts/ptmx.

However, this is not preserved by bind mounts to /dev/ptmx: for example, af=
ter
launching

"# mount --bind /dev/ptmx /dev/ptmx"

any attempt to opening /dev/ptmx will fail. Instead, bind mounting
/dev/pts/ptmx works as expected (if devptsfs has previously been mounted wi=
th
ptmxmode=3D0666). This is quite problematic if one wants to give access to
/dev/ptmx inside a mount namespace. The solution provided in
https://docs.kernel.org/filesystems/devpts.html is to remount devptsfs with=
 the
mount option ptmxmode=3D0666, then remove /dev/ptmx and finally place a bind
mount or a symlink pointing to /dev/pts/ptmx.

The issues involving documentations are the following:

1. man 4 pts only describes the old interface /dev/ptmx and the newer defice
file /dev/pts/ptmx is never mentioned. /dev/pts/ptmx should at least be
mentioned as an alternative for /dev/ptmx both to help software maintainers
moving to the new interface and to provide access to pseudoterminals inside
mount namespaces;

2. nowhere inside the documentation is explained if it is safe to provide
access to both /dev/ptmx and /dev/pts/ptmx at the same time. All provided
scenarios give access to exactly one of /dev/ptmx and /dev/pts/ptmx device
files. If we have to avoid giving full access to both /dev/ptmx and
/dev/pts/ptmx through ptmxmode=3D0666 (to avoid race conditions) then it sh=
ould
be explicitly stated. On the contrary, a note that says there are no proble=
ms
in giving full access to both these device files at the same time should be
added.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
