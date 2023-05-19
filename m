Return-Path: <linux-man-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2D88C77B73
	for <linux-man@archiver.kernel.org>; Fri, 19 May 2023 02:11:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229782AbjESCLY (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Thu, 18 May 2023 22:11:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjESCLX (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Thu, 18 May 2023 22:11:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69B4410C2
        for <linux-man@vger.kernel.org>; Thu, 18 May 2023 19:11:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 003C265394
        for <linux-man@vger.kernel.org>; Fri, 19 May 2023 02:11:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6224CC433EF
        for <linux-man@vger.kernel.org>; Fri, 19 May 2023 02:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684462281;
        bh=JMmP22norpIl4qXf2WqvpqSrGen+gL6KSW4mg+ptfI8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=OW5MDQ1OmDgwmqgHftj+DixMatAHTK7kHV+W9N18uT9TpHc9lYuS9eaS3UmwyrXpB
         cyASzQYSirsa8gK71YWgZKtaga9axYQgDKcH//8D9bexibsM6PPdc4eK0/HP2gwMNx
         bNEcU0HLAdvhM97KdsWHhgrIop8PtfDFOT6aU+LywBPYk3v8YsGH22kQtEXpVn1pTe
         Cj0b4yJpc9rIGyVBBaTGiVDKQ8cgTfshpSqenmgHElD+CsbpaLYvb8p0+BCTlpkVTK
         kfeVEPSgJhWP3eJApMqmg2CwlrpN+UwbIqJy2QSMSvu8PgsNf0lbJ0a6TpzrwpVmMv
         xJRQhZSdIuHow==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 45BAFC43144; Fri, 19 May 2023 02:11:21 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-man@vger.kernel.org
Subject: [Bug 216667] Self-contradictory description of inheritable
 capability set
Date:   Fri, 19 May 2023 02:11:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo
 documentation_man-pages@kernel-bugs.osdl.org
X-Bugzilla-Product: Documentation
X-Bugzilla-Component: man-pages
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rhmcruiser@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: documentation_man-pages@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216667-11311-znCAseg8xB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216667-11311@https.bugzilla.kernel.org/>
References: <bug-216667-11311@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216667

Monthero Ronald (rhmcruiser@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |rhmcruiser@gmail.com

--- Comment #1 from Monthero Ronald (rhmcruiser@gmail.com) ---

It's to make a distinction between a root user and non root user for the
process. The first part of the paragraph below is for root user and the lat=
er
part is for execve run as non root user. And on other hand applications ( u=
sing
execve) that run with few elevated capability flags can use ambient
capabilities.  The statement you quoted from man page  - Inheritable section
below:=20
---=20
Inheritable
              This  is  a  set of capabilities preserved across an execve(2=
).=20
Inheritable capabilities remain inheritable when executing
              any program, and inheritable capabilities are added to the
permitted set when executing a program that has the  correspond=E2=80=90
              ing bits set in the file inheritable set.

              Because inheritable capabilities are not generally preserved
across execve(2) when running as a non-root user, applications
              that wish to run helper programs with elevated capabilities
should consider using ambient capabilities, described below.
---

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
