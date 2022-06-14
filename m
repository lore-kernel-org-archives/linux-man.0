Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17871C433EF
	for <linux-man@archiver.kernel.org>; Tue, 14 Jun 2022 10:17:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232479AbiFNKRn (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Tue, 14 Jun 2022 06:17:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232213AbiFNKRm (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Tue, 14 Jun 2022 06:17:42 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B374403EC
        for <linux-man@vger.kernel.org>; Tue, 14 Jun 2022 03:17:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 21790B817E0
        for <linux-man@vger.kernel.org>; Tue, 14 Jun 2022 10:17:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C4B37C341C0
        for <linux-man@vger.kernel.org>; Tue, 14 Jun 2022 10:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655201858;
        bh=w0OcvyP0YIsCfZQ+h7DslrenLK1M+Xr6QaExK0+8lR0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ifhMhXhWRA3OEs48qTJtEPimQfYeVSmefe+UIq1IMPzudyWgx1SO2emBIOoXo/JJC
         YyCjL++9NCP06L0Hxw0xIsZVQx23/0uXhPhdLeej+a51ekj6y6ekasP0D0I6aHFPiQ
         tz+E8cW0+TReJlivOSZ2Fj+p5/3BQ5GiEE7p5xhEQ/5f9D8V3yCiMv8VVl6B5SzjRD
         r+00Y9mk9hBe1C5wyYl1JkDckYODGAClxAjbNOv3NuCTEyo0ZXTQa7e4VgWHk5kZms
         PdsaHX1JtTIPBolnGhNw8GaaTLOXR59JVFP1126QSJAhIzKirbGqhIE68+XxN+Afmq
         +ilz2YkLjIAuw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id AF424C05FD5; Tue, 14 Jun 2022 10:17:38 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-man@vger.kernel.org
Subject: [Bug 216121] Links
Date:   Tue, 14 Jun 2022 10:17:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo
 documentation_man-pages@kernel-bugs.osdl.org
X-Bugzilla-Product: Other
X-Bugzilla-Component: Spam
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: other_spam@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: component version assigned_to product
Message-ID: <bug-216121-11311-FXQEEyWzhl@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216121-11311@https.bugzilla.kernel.org/>
References: <bug-216121-11311@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216121

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|man-pages                   |Spam
            Version|unspecified                 |2.5
           Assignee|documentation_man-pages@ker |other_spam@kernel-bugs.kern
                   |nel-bugs.osdl.org           |el.org
            Product|Documentation               |Other

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
