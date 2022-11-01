Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5248DC4332F
	for <linux-man@archiver.kernel.org>; Tue,  1 Nov 2022 14:28:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230106AbiKAO2L (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Tue, 1 Nov 2022 10:28:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbiKAO2H (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Tue, 1 Nov 2022 10:28:07 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EE28DF0D
        for <linux-man@vger.kernel.org>; Tue,  1 Nov 2022 07:28:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 346416153B
        for <linux-man@vger.kernel.org>; Tue,  1 Nov 2022 14:28:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 85F24C433B5
        for <linux-man@vger.kernel.org>; Tue,  1 Nov 2022 14:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667312883;
        bh=0eKpyGR86VvDuriqkVssfSczVmYeqKlq2m7WiRBNdcA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=c0wlw7fTWTAkyMMKwFdfiN5zrE0PnH2Bv+YAC72pkKojEXaLsSnctDQmCctAyatB5
         QsWGN954JrXytEKcUSj5RJVwN6IPndp8+Ob1Tom4u0tggsdyYgLrN1qTwRk8P4GcHT
         jTDw6cN+SWZe4K89tkUW6iNpnRXFtPisHDT1lRrzOMYMdymEo4li9KintQjAFMVuaq
         iJCwfzDqy4eK1zl5Mx70jA3waM3pLK+GKDKLqFsxVPKkb5z9XRqwmQreBjG7W1gpfq
         xbqlpKDNez0V0+Esq4EVngCCZRM6BdcnJR8rjcGa9moZ0W42ji4yzw4pYxSnlxn5k8
         3kXjiTQ4T9Qeg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 72A58C433EA; Tue,  1 Nov 2022 14:28:03 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-man@vger.kernel.org
Subject: [Bug 216648] man 5 core incorrectly states circumstances in which a
 core is not produced
Date:   Tue, 01 Nov 2022 14:28:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo
 documentation_man-pages@kernel-bugs.osdl.org
X-Bugzilla-Product: Documentation
X-Bugzilla-Component: man-pages
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alx.manpages@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: documentation_man-pages@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216648-11311-SGy72GIYnN@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216648-11311@https.bugzilla.kernel.org/>
References: <bug-216648-11311@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216648

Alejandro Colomar (man-pages) (alx.manpages@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alx.manpages@gmail.com

--- Comment #1 from Alejandro Colomar (man-pages) (alx.manpages@gmail.com) =
---
Hi Luca,

Do you have any experiments demonstrating the actual behavior?  Could you s=
how
them?  And do you suggest any specific patch for that page?

You may consider reading
<https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/tree/CONTRIBUT=
ING>
if you would like to send a patch for the page.

Thanks!

Alex

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
