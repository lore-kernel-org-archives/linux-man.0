Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4878C4338F
	for <linux-man@archiver.kernel.org>; Sun,  8 Aug 2021 23:06:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8669160E78
	for <linux-man@archiver.kernel.org>; Sun,  8 Aug 2021 23:06:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230024AbhHHXGT (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sun, 8 Aug 2021 19:06:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:37430 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231158AbhHHXGR (ORCPT <rfc822;linux-man@vger.kernel.org>);
        Sun, 8 Aug 2021 19:06:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 0955560E96
        for <linux-man@vger.kernel.org>; Sun,  8 Aug 2021 23:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628463958;
        bh=FgUn4jV9RxFj4rVq7gRwZ850I5dbePFZWIWDd/Qnqc0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=G/d5oNYM9XPhCq/esW9SHUn8SmAyFgNYvc6SZmXFif1yiq0W3yunBfBt+m3wOOmTh
         zyiML8r9OxwY1wWmvdw3W4sr48inZGHNxp993w+3hpJi/Ap0Dz1VMnD9IiZniLWV+U
         LOE/f46yiQvlX3BzflUaWjoGZ1XYEl/bOBbTQ2tH3Imobiyx1/8y7YY6rXTgcThB/I
         HlseG/0QHHddnLJWGZqjE1EHnhdtmj20PF+vj5AirZOwuVtz9oHaX0nZIwpQNyF8h1
         n5dh2PatrN93IH6CNmHvaquER1fgzGFC29YUHUILao4eaIPCVTwhpgzV+P9WWM6No6
         JrYMFfR1Y8NiQ==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-man@vger.kernel.org
Subject: [Bug 212385] path_resolution(7): "a pathname with a trailing '/' is
 equivalent to the pathname obtained by appending '.' to it" - this is wrong
Date:   Sun, 08 Aug 2021 23:05:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo
 documentation_man-pages@kernel-bugs.osdl.org
X-Bugzilla-Product: Documentation
X-Bugzilla-Component: man-pages
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mtk.manpages@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: documentation_man-pages@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-212385-11311-XiyFPvTXN2@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212385-11311@https.bugzilla.kernel.org/>
References: <bug-212385-11311@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D212385

Michael Kerrisk (mtk.manpages@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mtk.manpages@gmail.com

--- Comment #1 from Michael Kerrisk (mtk.manpages@gmail.com) ---
Hello Askar. Thanks for the report. Yes, the text is a bit off.

The text in POSIX.1-2018 Section 4.13 ("Pathname Resolution")
is helpful in pointing to a better wording.

How about the following as a replacement text:

       If a pathname ends in a '/', that forces resolution of the
       preceding component as in Step 2: the component preceding the
       slash either exists and resolves to a directory of it names a
       directory that is to be created immediately after the
       pathname is resolved.  Otherwise, a trailing '/' is ignored.

I'm closing this bug report for now. Please reopen if you think something s=
till
needs fixing.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
