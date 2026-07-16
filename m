Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15990168BD
	for <linux-man@vger.kernel.org>; Thu, 16 Jul 2026 19:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784231608; cv=none; b=N8G9SBMS9oZgWWXS+7kNHLYCNPRyoIBovpIuO3o/3FRwGwcykp1MQzr6CCEElnMd7+DxiwyIMn08R8gwU+mW3GFZ6HLW4TCwe/F/X9+DQDxe7dfG+/eXoiBE1J1H1H26E6hHlDDZFGxIAB/uk+dphYyu7Lg9AqOug6zvh4kMm0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784231608; c=relaxed/simple;
	bh=WwpzLY4wAmBJYHzOotLA7eRfgAYLUZ44ev5600FqYHQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WeWmRwFcPH+OFeQ9azW+lKHjqHHo4tc7HXczcJEZkvYABpeaiyBgVHBEpg56vjqoW03ZUWIzt2Y6dqlCTVeYHTBvo3Im596xF5xSq9DkfOy0QO1HbM46NOf8r06CLthDEfRL1V2+yE8NSsaNghM4oDgR9m7GBHztgUbKxHocguU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qSCD+Z8y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qSCD+Z8y"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 96BF7C2BCC7
	for <linux-man@vger.kernel.org>; Thu, 16 Jul 2026 19:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784231607;
	bh=WwpzLY4wAmBJYHzOotLA7eRfgAYLUZ44ev5600FqYHQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=qSCD+Z8y3DGg39dCJ7BEOww+zXUny4YN/sqKMm+6sV3OA/r+UAvKc5mHiDu7jtTMg
	 bGxasGmmRD1AkNhtljH1wwIU256E3+RdxGzfQVRO9UZMpO/L5LJrAlbxUSzRv/IG86
	 uiJ3XwFaQ6C2KU1FRW5W+HbV1G1o2ZDQBe8+XWNuvgNODV9oD32fKMtYoJpXIUHsSZ
	 3x29ZqzSTSnsQlznAxurRZ08uDLLwXXaLCIZ+IPsOlIG0xC0XSLHmpGtEbE/bpDLZi
	 gp7uPkbJ2TqGm96t9oRMhgRsJyoLr0EoIgjOmyuOI46rsPrzSqtYHyzew+bgHWO4Gi
	 Yq8V+f6ZY93hg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 75814C4160E; Thu, 16 Jul 2026 19:53:27 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-man@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjE3MTVdIOKAnG1ha2UgLVIgYnVpbGQtcGRmLXBhZ2Vz?=
 =?UTF-8?B?LXRyb2Zm4oCdIGZhaWxzIHdpdGgg4oCcd2FybmluZzogdGFibGUgcm93IGRv?=
 =?UTF-8?B?ZXMgbm90IGZpdOKAnQ==?=
Date: Thu, 16 Jul 2026 19:53:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo
 documentation_man-pages@kernel-bugs.osdl.org
X-Bugzilla-Product: Documentation
X-Bugzilla-Component: man-pages
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: g.branden.robinson@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: documentation_man-pages@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221715-11311-Jx2EwZYPzp@https.bugzilla.kernel.org/>
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

G. Branden Robinson (g.branden.robinson@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |g.branden.robinson@gmail.co
                   |                            |m

--- Comment #2 from G. Branden Robinson (g.branden.robinson@gmail.com) ---
Hi Alex,

This seemed to do the trick for me.

diff --git a/man/man4/console_codes.4 b/man/man4/console_codes.4
index 2fa8368e1..5c0508d4e 100644
--- a/man/man4/console_codes.4
+++ b/man/man4/console_codes.4
@@ -413,6 +413,8 @@ .SS Linux console controls
 set background, same as 40..47 (bright not supported)
 T}
 .TE
+.br
+.ne 4v
 .P
 Commands 38 and 48 require further arguments:
 .P
@@ -762,6 +764,8 @@ .SS Comparisons with other terminals
 T}
 ESC ] 50 ; \f[I]fn\f[] ST      Set font to \f[I]fn\f[].
 .TE
+.br
+.ne 4v
 .P
 It recognizes the following with slightly modified meaning
 (saving more state, behaving closer to VT100/VT220):

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
