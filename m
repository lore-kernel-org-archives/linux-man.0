Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDFA4AE8B1
	for <linux-man@vger.kernel.org>; Mon,  5 Oct 2026 15:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791214286; cv=none; b=KQeQoT6DL6H3ar/7zYXkKpYnptR+hdS6PrX3R5NlPsdOQ9zqZleFefa3vGoSm4kZ4V1dLAlrq9C0aPEEbG0pQvvQFoQYxuytcaeYhhv/cyJ+JrVVjN5xtVn4CadZD0ujY3bNGODsRFaP58S5QcAD+Jx+HiY76sXyjs0WKudeI3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791214286; c=relaxed/simple;
	bh=oAmEBltFFrt3QUUWItTa1lh+gv0XL4CiGWKQtkncIAA=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Pe0sVleYtZlsM/mCwbgWCO5hJWdspmLyDp5BuDYp2pVJ+HJs8dt8D4T+5RDX8Z+uYutmMdGY9Lhl/cRYkkN1qnp30hyEfvfEt9b6emmCMeUUfV2Tv2Qhsh1mtw4Rx3I/tdh/+WzNV6Onss5cF2E7Z9v2ElbJ2Tm1lcTRw+sds3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EAzW6k4W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EAzW6k4W"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2E654C4AF60
	for <linux-man@vger.kernel.org>; Mon,  5 Oct 2026 15:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791214286;
	bh=oAmEBltFFrt3QUUWItTa1lh+gv0XL4CiGWKQtkncIAA=;
	h=From:To:Subject:Date:From;
	b=EAzW6k4WQNdAhkLrqOuQqxCfuSKZf5d78Wk3zXgiPkHirBktJ9KCaxI2lArn6ziNy
	 OlN3BO4Od03iX7dJyq0/DeuAe86jgKdpCVwN23tWYvUeDo6Eh6m2VFmRkVb5mVH2HG
	 qIhO73Zmooa2yewU/elS3p22V72IIbIqygO1mITJQN/NMUEoEbLY+54saSSPwjeiof
	 6Znp5IfexRKl1yxm5pdpAroZNiDH6YYwJyin+4K7guqTNVtN91EjVBJ4KNuflrLN02
	 Nzhwctf7epTbfmlK8uWqqjwuYJ8bjBtzxe4BJim+lpdjKEUA1sBTMEzpR0AX1x5p17
	 0AF3Q4yfguO9Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0FD7EC53BC5; Mon,  5 Oct 2026 15:31:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-man@vger.kernel.org
Subject: [Bug 222094] New: sched_setattr: bug in `ERRORS` section w.r.t.
 `attr.sched_flags contains a flag other than SCHED_FLAG_RESET_ON_FORK`
Date: Mon, 05 Oct 2026 15:31:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo
 documentation_man-pages@kernel-bugs.osdl.org
X-Bugzilla-Product: Documentation
X-Bugzilla-Component: man-pages
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: yaneurabeya@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: documentation_man-pages@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-222094-11311@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222094

            Bug ID: 222094
           Summary: sched_setattr: bug in `ERRORS` section w.r.t.
                    `attr.sched_flags contains a flag other than
                    SCHED_FLAG_RESET_ON_FORK`
           Product: Documentation
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: man-pages
          Assignee: documentation_man-pages@kernel-bugs.osdl.org
          Reporter: yaneurabeya@gmail.com
        Regression: No

Per https://www.man7.org/linux/man-pages/man2/sched_getattr.2.html:

This scenario documented in the manpage implies that `attr.sched_flags` mus=
t be
set to `SCHED_FLAG_RESET_ON_FORK`:

>       EINVAL attr.sched_flags contains a flag other than
>       SCHED_FLAG_RESET_ON_FORK.

The second scenario implies that `attr.sched_flags` is a bitmask which can
contain `SCHED_FLAG_UTIL_CLAMP_MIN` or `SCHED_FLAG_UTIL_CLAMP_MAX`:

>       EINVAL attr.sched_flags contains SCHED_FLAG_UTIL_CLAMP_MIN or
>       SCHED_FLAG_UTIL_CLAMP_MAX, and attr.sched_util_min or
>       attr.sched_util_max are out of bounds.

The first case contradicts the second case.

Doing some digging in the kernel source code [1], I couldn't find an obvious
spot where the first scenario was actually implemented -> **I think the
`SCHED_FLAG_RESET_ON_FORK ` scenario is a documentation bug.**

1.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/ker=
nel/sched/syscalls.c?id=3D786244f70322e41c937e69f0f935bfd11a9611bf

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
