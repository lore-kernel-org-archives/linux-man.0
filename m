Return-Path: <linux-man-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57097C0018A
	for <linux-man@archiver.kernel.org>; Wed,  1 Nov 2023 14:07:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344051AbjKAOHW (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Wed, 1 Nov 2023 10:07:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235094AbjKAOHT (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Wed, 1 Nov 2023 10:07:19 -0400
Received: from mail.helgefjell.de (unknown [IPv6:2a01:4f8:261:4d55::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81C1410D
        for <linux-man@vger.kernel.org>; Wed,  1 Nov 2023 07:07:17 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
  (uid 1002)
  by mail.helgefjell.de with local
  id 000000000002131E.0000000065425A63.000FACC6; Wed, 01 Nov 2023 14:02:11 +0000
Date:   Wed, 1 Nov 2023 14:02:11 +0000
From:   Helge Kreutzmann <debian@helgefjell.de>
To:     alx.manpages@gmail.com
Cc:     mario.blaettermann@gmail.com, linux-man@vger.kernel.org
Subject: Issue in man page mount_namespaces.7
Message-ID: <ZUJaY1wRIqZXKjpA@meinfjell.helgefjelltest.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Public-Key-URL: http://www.helgefjell.de/data/debian_neu.asc
X-homepage: http://www.helgefjell.de/debian
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Without further ado, the following was found:

Issue:    mount point → mount ?

"The propagation type assigned to a new mount depends on the propagation type "
"of the parent mount.  If the mount has a parent (i.e., it is a non-root "
"mount point) and the propagation type of the parent is B<MS_SHARED>, then "
"the propagation type of the new mount is also B<MS_SHARED>.  Otherwise, the "
"propagation type of the new mount is B<MS_PRIVATE>."
