Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CE7FECAAA1
	for <linux-man@archiver.kernel.org>; Tue,  6 Sep 2022 09:42:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239596AbiIFJmr (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Tue, 6 Sep 2022 05:42:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239503AbiIFJma (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Tue, 6 Sep 2022 05:42:30 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F434786CE
        for <linux-man@vger.kernel.org>; Tue,  6 Sep 2022 02:42:03 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id CC2ED1F9D6;
        Tue,  6 Sep 2022 09:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1662457321;
        h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
         cc:cc:mime-version:mime-version:content-type:content-type;
        bh=Y4WwQ+BxANTQ/PSF9yyzIE1ycqJyCRMRhuvNxhei9CA=;
        b=w5wmvnuftl3TcoGnKlat6JoJ078zC+preanPZDAfMZNuqU9IY3YsCpK/u1mFuL7D3odw0t
        89eFEpCNZ7lh7dxzGN1vkrFLKzWdc1dcUoAffNPT169TWoqHIhcp9h1+yHAgQkUQjdM8bC
        2d6h2GDZBP1s3un5ANL53d6Rtq0HlZk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1662457321;
        h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
         cc:cc:mime-version:mime-version:content-type:content-type;
        bh=Y4WwQ+BxANTQ/PSF9yyzIE1ycqJyCRMRhuvNxhei9CA=;
        b=x4XxoeHAknwZdZrFBoaNsyla9n6jdTZRu/lutiBusooN5CiGyfmsgL92/8V2RPcyJhnvPw
        hE3Qz/91QK2ce9Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8ED5813A7A;
        Tue,  6 Sep 2022 09:42:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id YzduIOkVF2OicgAAMHmgww
        (envelope-from <pvorel@suse.cz>); Tue, 06 Sep 2022 09:42:01 +0000
Date:   Tue, 6 Sep 2022 11:41:54 +0200
From:   Petr Vorel <pvorel@suse.cz>
To:     Alejandro Colomar <alx.manpages@gmail.com>
Cc:     linux-man@vger.kernel.org, Michael Kerrisk <mtk.manpages@gmail.com>
Subject: Revert 70ac1c478 ("src.mk, All pages: Move man* to man/")
Message-ID: <YxcV4h+Xn7cd6+q2@pevik>
Reply-To: Petr Vorel <pvorel@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Hi Alejandro,

yesterday you merged this commit (without sending it to ML):
70ac1c478 ("src.mk, All pages: Move man* to man/")

Although I agree that number of man* is quite high and single man directory
looks nicer, from practical reasons I'd prefer to revert this commit.
Because saving one extra cd is IMHO more important.

Kind regards,
Petr
