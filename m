Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B41D1B268
	for <linux-man@vger.kernel.org>; Wed,  3 Jan 2024 15:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PqUYq59+"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 98547C433C9
	for <linux-man@vger.kernel.org>; Wed,  3 Jan 2024 15:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704295925;
	bh=eAx0lGO/jAszx7nKC1GY/wsrdGNcX2HZ+On8IPGXiy4=;
	h=From:To:Subject:Date:From;
	b=PqUYq59+5YauzJju3NA/Ll6dEyppQs0YinAeXcwP8DWCWYin7hzamKQ6x7mEWBdzP
	 FVD2eGQLpjCIhPO6Ry8FpDPWp6RFjGK/Yb0/4biYqKTSIa3QOD1H6b323CAcSDzdx2
	 8R/6h10Jtv34UHlEitbptXdQKhnUp1HY62PsGkUbBnFVQGNogUI3J7RMH2LMZe8HZZ
	 kHli1OgohVJMqv6n5U9ENhFIphhGsj7R3oEJlErfl6V8+Fgi5l73Sn87+qHx0LLyAT
	 td9pMDYz4S8zL3/4FQ3E471pF8psWoUhHlpFBxBJrP9uTtdhm4MZ21p1x31ykNiBiv
	 e0QdSQziPQgrw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 832E1C53BD3; Wed,  3 Jan 2024 15:32:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-man@vger.kernel.org
Subject: [Bug 218336] New: mount(2) doesn't document ENOSPC when
 /proc/sys/fs/mount-max is exceeded
Date: Wed, 03 Jan 2024 15:32:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo
 documentation_man-pages@kernel-bugs.osdl.org
X-Bugzilla-Product: Documentation
X-Bugzilla-Component: man-pages
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: smcv@collabora.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: documentation_man-pages@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-218336-11311@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218336

            Bug ID: 218336
           Summary: mount(2) doesn't document ENOSPC when
                    /proc/sys/fs/mount-max is exceeded
           Product: Documentation
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: man-pages
          Assignee: documentation_man-pages@kernel-bugs.osdl.org
          Reporter: smcv@collabora.com
        Regression: No

When setting up mount points in a new mount namespace, if
/proc/sys/fs/mount-max is exceeded, mount(2) will fail with ENOSPC. This is=
n't
documented in mount(2) as a possible error result.

In this situation, the error message "No space left on device" from strerro=
r()
is misleading: usually all of the user's filesystem devices will have plent=
y of
space. The actual problem is that an essentially arbitrary
anti-denial-of-service limit, orthogonal to how much space exists on any
particular device, has been exceeded.

For example, this could easily happen when running Flatpak, which creates n=
ew
user and mount namespaces using the bubblewrap tool:

$ echo 50 | sudo tee /proc/sys/fs/mount-max
$ flatpak run org.gnome.Platform//45=20=20=20=20=20=20=20
bwrap: Failed to mount tmpfs: No space left on device
error: ldconfig failed, exit status 256

I'm going to send a PR to bubblewrap to make it special-case ENOSPC and dis=
play
a clearer error message in this case. It would be helpful if mount(2) indic=
ated
ENOSPC as a possible error here, so that maintainers of projects like
bubblewrap could make sure to allow for it.

https://github.com/ValveSoftware/steam-runtime/issues/637 is a real-world
report of this happening in Steam's Steam Linux Runtime container framework,
which is very similar to Flatpak.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
