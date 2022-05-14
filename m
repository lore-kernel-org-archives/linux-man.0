Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D32C3C433F5
	for <linux-man@archiver.kernel.org>; Sat, 14 May 2022 14:55:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233300AbiENOzq (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sat, 14 May 2022 10:55:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229617AbiENOzp (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sat, 14 May 2022 10:55:45 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 367ED1A3BC
        for <linux-man@vger.kernel.org>; Sat, 14 May 2022 07:55:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E1198B80123
        for <linux-man@vger.kernel.org>; Sat, 14 May 2022 14:55:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8FB09C34118
        for <linux-man@vger.kernel.org>; Sat, 14 May 2022 14:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652540141;
        bh=6HXLDYtvGQjjCzfyihn05IvWnsRSo4djbzlfAfGYzQE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=NK6Zv4LhyHku01qy4R3WY1sIpydqWILhlCM4yu+WRXhlm5qLEECsONlgULPVUXGcd
         lJpvIq1DiBtZqtaqKu7qxfaD+HkQoyHSM0wTSPLqdBBOaH5rWssr0ldYv4VTGp7GRZ
         bWBQxx2nhT25Ek33KIh6Gj14uT3q3i9EdQ30d+n9ovnYB4rahk/Nvi/NqjIenqYl95
         eldy2nzmHYx0stdDk1cwXB4UjMgMPoiGFq0PS7566ndBg8H7eoik6PtDbfz/1JF1dG
         OxbkT6adkHs3T+tLfd2eHUwz9KCfTf8aw0oZc5j1RF0c2beps/QWcC6McSs6rzf0AH
         e26gsL97s3H/g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 721C2CC13B3; Sat, 14 May 2022 14:55:41 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-man@vger.kernel.org
Subject: [Bug 215738] uri.7: CONFORMING TO: Refers to obsolete IETF RFC 2396
Date:   Sat, 14 May 2022 14:55:41 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215738-11311-HioUlnvKmQ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215738-11311@https.bugzilla.kernel.org/>
References: <bug-215738-11311@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215738

--- Comment #3 from Alejandro Colomar (man-pages) (alx.manpages@gmail.com) =
---
But does the manual page really conform to the newer RFCs?  The contents are
quite large, and I don't know if some details of it are actually obsolete a=
nd
should be fixed.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
