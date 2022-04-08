Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34117C433F5
	for <linux-man@archiver.kernel.org>; Fri,  8 Apr 2022 10:55:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231808AbiDHK5Q (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Fri, 8 Apr 2022 06:57:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234793AbiDHK5O (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Fri, 8 Apr 2022 06:57:14 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 067E267D3B
        for <linux-man@vger.kernel.org>; Fri,  8 Apr 2022 03:55:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 951C561E4B
        for <linux-man@vger.kernel.org>; Fri,  8 Apr 2022 10:55:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 01061C385A8
        for <linux-man@vger.kernel.org>; Fri,  8 Apr 2022 10:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649415310;
        bh=08pTtOuZ0Nj7LrNLTE+qCDKjf+PXHxG/N/D7Q9G01fA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=N8+itDsFOZkcSShP6DQC/wYrCJNDrBrTcsAwGncChgW6jkuWXk++IV/6mZ33E2vmM
         RCTlQzP0FKVPx+15ggkCc97WLtn/Z996lY2OXNNSanxPAje66TLfwe0SMQNV+waIzR
         1B3ZLwXJGlT24yL3VJy8e2xiZyHrSezCxdVDed95C/7VNiAv74eyBMVK2Mduow7i99
         zlBg51uRCIP3sIOFJKCptiUg+kCrGbc4zZvXiltiB+uNKukNeVkvJjZQrNIjvqJCq2
         ex7FgGqXKgDD307mzpMoYJMdaMMCl7KESHs5SFXmqrIirX1zgNnPN1bpVWAf08q7L8
         RIWPIYcCf5cpw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id DB129C05FCE; Fri,  8 Apr 2022 10:55:09 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-man@vger.kernel.org
Subject: [Bug 215769] vfork() returns EINVAL after unshare(CLONE_NEWTIME)
Date:   Fri, 08 Apr 2022 10:55:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo
 documentation_man-pages@kernel-bugs.osdl.org
X-Bugzilla-Product: Documentation
X-Bugzilla-Component: man-pages
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: socketpair@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: documentation_man-pages@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: short_desc
Message-ID: <bug-215769-11311-dOyeYWLbkN@https.bugzilla.kernel.org/>
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

=D0=9A=D0=BE=D1=80=D0=B5=D0=BD=D0=B1=D0=B5=D1=80=D0=B3 =D0=9C=D0=B0=D1=80=
=D0=BA (socketpair@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|man 2 vfork() does not      |vfork() returns EINVAL
                   |document corner case when   |after
                   |PID =3D=3D 1                    |unshare(CLONE_NEWTIME)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
