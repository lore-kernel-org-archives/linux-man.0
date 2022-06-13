Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60765C43334
	for <linux-man@archiver.kernel.org>; Mon, 13 Jun 2022 19:53:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344563AbiFMTxB (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Mon, 13 Jun 2022 15:53:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344627AbiFMTws (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Mon, 13 Jun 2022 15:52:48 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E31D3CA61
        for <linux-man@vger.kernel.org>; Mon, 13 Jun 2022 11:23:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2A5E5B81250
        for <linux-man@vger.kernel.org>; Mon, 13 Jun 2022 18:23:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CE6C6C3411C
        for <linux-man@vger.kernel.org>; Mon, 13 Jun 2022 18:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655144615;
        bh=vkOL4adYkAVw6rBYt/WaLFIumg8UxOTvDh14+L5ZUA0=;
        h=From:To:Subject:Date:From;
        b=U/SCIucVcy4Gob4C0dpXRZ2bKlqskZC63a83n0LBIXbGU8wnaiKRuDiwax2sbb4B9
         Uqrc5f+EB+fyAtIj0+MlYZ5h+ej8DM/SwkdN9/jFtZ34GTFMrnOyARYvo3lPdBslfv
         zmF/eE+ZEOnH29GnJfJto2z/Zx/JlkfIruBYn5APt24yDYSMxg3kixwi+vQtyRGl3O
         NB+YaAVDG/xY5BUYcayYgE5MKCAdp1HyujOeV+2aZ9RajuddtBwoE0PIY64SlF1tFg
         uGfQ7KMBxs8t25bU0sGjcEZGArPbU1bE5Y52hPOcysDrZb65HSIZkJ39YdpiVlXDRo
         fBsG0AypCEAuw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id B99D7CBF854; Mon, 13 Jun 2022 18:23:35 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-man@vger.kernel.org
Subject: [Bug 216121] New: Links
Date:   Mon, 13 Jun 2022 18:23:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo
 documentation_man-pages@kernel-bugs.osdl.org
X-Bugzilla-Product: Documentation
X-Bugzilla-Component: man-pages
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: locutor99@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: documentation_man-pages@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-216121-11311@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216121

            Bug ID: 216121
           Summary: Links
           Product: Documentation
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
          Assignee: documentation_man-pages@kernel-bugs.osdl.org
          Reporter: locutor99@gmail.com
        Regression: No

Test
Spanish voice over from
https://www.locutortv.com/
https://www.locutortv.es/
https://www.amorypoesia.es/
https://www.locutortv.es/index_voiceoversspanish.htm

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
