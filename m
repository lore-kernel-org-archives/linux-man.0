Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFC51A9F93
	for <linux-man@vger.kernel.org>; Sat,  7 Mar 2026 14:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772893278; cv=none; b=Dnusmf+yF8FLVGWt6mdVmu+pdtMnpFCswLspTOAKAD0GOicOCkzcKcDhYXu299UG8lZiDieouFsA4FM70u2hNYtuj5Hg6fWgaR8dpsqlhcFCdnkzPdS1XIddYuZrcWf+gMR+HeopK+CeU1rTGH7mxRrWbvJ9EtFUV+QbfAAk/go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772893278; c=relaxed/simple;
	bh=qp6TRbHkUDrAbF5BXKARLuksfWGFq5So68kpwVH72Qw=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=UXeAxhYt3zKgHPtQmmKtcjcqVFPNWEuR1HoCGJXym4tqcPUX/1w87ta5yhr2NzhgmIyM9rF2vs4OIdn863gUUt1a32+gYmae0n3LQ43g6pfUyAh/LA23jS9lLgk8tPk42xjp20SM1Jv0RSC3i2+PfUqE777kj2+gLRUtl0IiRrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ELJDYkCY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ELJDYkCY"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B1121C2BC9E
	for <linux-man@vger.kernel.org>; Sat,  7 Mar 2026 14:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772893277;
	bh=qp6TRbHkUDrAbF5BXKARLuksfWGFq5So68kpwVH72Qw=;
	h=From:To:Subject:Date:From;
	b=ELJDYkCYZJrhUCb1VjweD41eGNZBs2Hf0RYmq2+36qUo0Yz3iu5Nv0p1WEAHcGlT6
	 ehZq9QCZfDe3FVCii6ed86NenKj/0E/O9LKhEeEBjErw9vLVD5cXg5GMMXZpWM/DXC
	 yUvhE81THPB1Z2nVXdIBb0rt6cDsM+FfQM8KvvwXDLEsnU5uHrfDUyEQBfEI6/vRaQ
	 SJDGNa8DpTdZQL9z8G45YKzNxAlz3e44KimjyL51wHGbJhZGFi6/InM2yjBuTcWAnx
	 nkF60ObI2qpj2rzmK9tmzBaaNQq2ESLqFWCDIy2NaQM6XHc6A8ToScyhfaS+vlUVc5
	 pSoNATn49LnLA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A735BC53BC7; Sat,  7 Mar 2026 14:21:17 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-man@vger.kernel.org
Subject: [Bug 221186] New: clock_gettime CLOCK_TAI is incorrectly specified
Date: Sat, 07 Mar 2026 14:21:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo
 documentation_man-pages@kernel-bugs.osdl.org
X-Bugzilla-Product: Documentation
X-Bugzilla-Component: man-pages
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mpatocka@redhat.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: documentation_man-pages@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-221186-11311@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221186

            Bug ID: 221186
           Summary: clock_gettime CLOCK_TAI is incorrectly specified
           Product: Documentation
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: man-pages
          Assignee: documentation_man-pages@kernel-bugs.osdl.org
          Reporter: mpatocka@redhat.com
        Regression: No

The man page for clock_gettime says "CLOCK_TAI (since Linux 3.10;
Linux-specific)
A nonsettable system-wide clock derived from wall-clock time but ignoring l=
eap
seconds."

When UTC was announced, it was already 10 seconds behind TAI. Since that, 27
leap seconds have been added. According to the man page, the difference bet=
ween
wall clock an CLOCK_TAI should be 27 seconds, but in it is 37 seconds in fa=
ct.
The kernel is correct (it returns 37 as the difference between TAI and UTC),
but the man page should be fixed to reflect that.

I suggest to change the man page to:

CLOCK_TAI (since Linux 3.10; Linux-specific)
A nonsettable system-wide clock showing physical time elapsed since Jan 1 1=
970
0:00:00.00 TAI (Dec 31 1969 23:59:50.00 UTC). This clock does not experience
discontinuities and backwards jumps caused by NTP inserting leap seconds as
CLOCK_REALTIME does. This clock changes when system time is adjusted by the
user or NTP for the purpose of correcting wrong time setting. TAI means tem=
ps
atomique international (International Atomic Time).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
