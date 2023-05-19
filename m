Return-Path: <linux-man-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACF37C77B7A
	for <linux-man@archiver.kernel.org>; Fri, 19 May 2023 11:51:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231587AbjESLv3 (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Fri, 19 May 2023 07:51:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231513AbjESLv2 (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Fri, 19 May 2023 07:51:28 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EF3C11F
        for <linux-man@vger.kernel.org>; Fri, 19 May 2023 04:51:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8BEC26570B
        for <linux-man@vger.kernel.org>; Fri, 19 May 2023 11:51:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ED555C433EF
        for <linux-man@vger.kernel.org>; Fri, 19 May 2023 11:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684497086;
        bh=vDCM9dfiYd4LJ6T1zGDYEut1H2D0QsS9EXxzjM6H1MU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=qJmqrSJmtwQB1z03edLK/Cn2wUT1VLbRTKWCdRJHh4ZU4aAVTv9Cb4DdyNE3PAxhe
         2Gw15r96QEpV58H5xJcHVWZ76r+bOlrVS5tUjbnSm8f0giq/BXfttPDHerOI910TtW
         xCFN3pes9hE/JCgb0cEpisTwxptOM1+T6F4/le+IT+K3fl6D9BFuZz6ewLuyp9QDOF
         A28QZzj4omwWrGtzK7bZnL6xT2/qT7531v1W6/YGtXZgkbSx8VibK+XeB0DXhGnGwE
         yy1/Mm7qb9TR/jbzIB3fZFGqEzcDz+qvQe1+0gkvpvdSu+aAIEbXQBFQ5isc7bhE2K
         Pil4HTkci0UZg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id D815FC43142; Fri, 19 May 2023 11:51:25 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-man@vger.kernel.org
Subject: [Bug 217253] mbind, set_mempolicy, migrate_pages: maxnode
 description is off-by-one
Date:   Fri, 19 May 2023 11:51:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo
 documentation_man-pages@kernel-bugs.osdl.org
X-Bugzilla-Product: Documentation
X-Bugzilla-Component: man-pages
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alx@kernel.org
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: documentation_man-pages@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status
Message-ID: <bug-217253-11311-mMq81HN5My@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217253-11311@https.bugzilla.kernel.org/>
References: <bug-217253-11311@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217253

Alejandro Colomar (alx@kernel.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |NEEDINFO

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
