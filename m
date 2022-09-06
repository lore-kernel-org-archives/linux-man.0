Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5FFEECAAA1
	for <linux-man@archiver.kernel.org>; Tue,  6 Sep 2022 08:33:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233002AbiIFIdD (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Tue, 6 Sep 2022 04:33:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233551AbiIFIdA (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Tue, 6 Sep 2022 04:33:00 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2113C55
        for <linux-man@vger.kernel.org>; Tue,  6 Sep 2022 01:32:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 950C0B81647
        for <linux-man@vger.kernel.org>; Tue,  6 Sep 2022 08:32:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 59953C433B5
        for <linux-man@vger.kernel.org>; Tue,  6 Sep 2022 08:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662453175;
        bh=3iZACyn4XJFw2TOL9CLoVnj+mvflM5ht/C1Sp6BiN8s=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=D2UL0uVshBbedYb8NZNnDBk5xriVKLNURR/rwlzG2HLKbdiGJWC0s6kCoUje5T/ve
         Te5XoNxJj0j0U1UzHenglMC0mxRaIlirn6uuu2hOK+u/RZmA0Ie5aCK1y6jprR+xCj
         E0Uk6Ho14JBOOjByNm+WjlWe4H2/wKOgS9C75wkiaGJMclmur5MAQ/JV8DtzRVPdjn
         snPs6WTs5I4ZCzjcpzBKui0W2zQgVaS/3637ALlWKqH7DbYrGkybqDpZfy4h2vlkVe
         I1VDCXmMLOduQJS3aXw3X8/x75tSdRnQZXym9SAqg+vEaoOxgfd0zm1AtGEaqv4BLG
         GkQH94smvlOzA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 456E1C433E7; Tue,  6 Sep 2022 08:32:55 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-man@vger.kernel.org
Subject: [Bug 215769] vfork() returns EINVAL after unshare(CLONE_NEWTIME)
Date:   Tue, 06 Sep 2022 08:32:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo
 documentation_man-pages@kernel-bugs.osdl.org
X-Bugzilla-Product: Other
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: socketpair@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: documentation_man-pages@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215769-11311-HgPjSQCS4V@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215769-11311@https.bugzilla.kernel.org/>
References: <bug-215769-11311@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215769

--- Comment #16 from =D0=9A=D0=BE=D1=80=D0=B5=D0=BD=D0=B1=D0=B5=D1=80=D0=B3=
 =D0=9C=D0=B0=D1=80=D0=BA (socketpair@gmail.com) ---
Please change "Assignee" please. It's not about documentation.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
