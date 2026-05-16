Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6AE3E3160
	for <linux-man@vger.kernel.org>; Sat, 16 May 2026 16:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778950063; cv=none; b=exzC+K3jw6CU2eLdAwtEfOBRaocsVbhPv40Uu+teeTbrahqe4dMEGSqGgFkR8T30ALEjv7I2kIaRmUwznOa0HlvFAE5H1CJOXUPfgNSCTD/twN/VZUKKR/L1MGPcEc9o3ZnJGzfAS+ZTx8A2kPZtjKwPxFclsWUFydrO3W8drHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778950063; c=relaxed/simple;
	bh=AA4NqgE2RXskP9f957ky6WwG3Y+RVUdZldE6ADztGlY=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=uVKguEs7Kse+tDyHb/4I9hnK84Xpa1n8LyqLkLaTfi26iNk+ASgt/2z4CqEhlz4SpR2/rvblSrqxQNxwLp5B+SjM4Lvr45sW7P/O7cEDTlR63pCJYPVxW5832PrCIOWtKGLDkhzqEQwbWqSGGcJJ+4lUWaCNIZNxFAMODxUcxhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NGHVANxz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NGHVANxz"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B7438C2BCC9
	for <linux-man@vger.kernel.org>; Sat, 16 May 2026 16:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778950062;
	bh=AA4NqgE2RXskP9f957ky6WwG3Y+RVUdZldE6ADztGlY=;
	h=From:To:Subject:Date:From;
	b=NGHVANxziSmFWUEBZpEV+7XwbZxUX0uJRP3Ftcw0n/GGLo+6N9zRjphPk4FIMY0hi
	 pzlg957r9Natr9nps/D/H4vIVCLTkfAe22eslk8gk0PYgwLBliJomkDuAtECY9v1vf
	 GkRcURc2ML+SNolYGbeuQ5jJZtKC9i6Ffj7UW3CK3ITwCd9USn8wlV5bxJ62ju+24v
	 Bw/sAIL6wk537wjYrIcE/f3ezmAaQwf8xUEv9LcjoLatVVRtSmcCnABr1OIKlvXDxr
	 Meek2i+kamiKHPUmbGk4y8BqCkh0ukW19D9JXRA0yq0l9ruQ+OQE7p/pwUcf+9DPAV
	 ZuGYGzLBGJW1Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AA4DDC53BBF; Sat, 16 May 2026 16:47:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-man@vger.kernel.org
Subject: [Bug 221533] New: strstr/c23/constness
Date: Sat, 16 May 2026 16:47:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo
 documentation_man-pages@kernel-bugs.osdl.org
X-Bugzilla-Product: Documentation
X-Bugzilla-Component: man-pages
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: linux@treblig.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: documentation_man-pages@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-221533-11311@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221533

            Bug ID: 221533
           Summary: strstr/c23/constness
           Product: Documentation
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: man-pages
          Assignee: documentation_man-pages@kernel-bugs.osdl.org
          Reporter: linux@treblig.org
        Regression: No

Hi,
  In C23 strstr can return a const char* if the first parameter is a const
char*;  this is also true of a bunch of the other routines.

  I'm not really sure how this should be documented, I guess two entries for
each function with some note saying it's only C23 and later?

See:
https://sourceware.org/cgit/glibc/commit/string/string.h?id=3Dcd748a63ab1a7=
ae846175c532a3daab341c62690

for the glibc change that implemented it.

It can break some existing code, e.g. something like:


int foo(const char *a)
{
   char *bar =3D strstr(a, "frog");
}

gives:
t.c:9:16: warning: initialization discards =E2=80=98const=E2=80=99 qualifie=
r from pointer
target type [-Wdiscarded-qualifiers]
    9 |    char *bar =3D strstr(a, "frog");
      |                ^~~~~~

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
