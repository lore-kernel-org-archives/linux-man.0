Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A09CEC433EF
	for <linux-man@archiver.kernel.org>; Thu, 10 Feb 2022 02:23:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229651AbiBJCXF (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Wed, 9 Feb 2022 21:23:05 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:40994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbiBJCXE (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Wed, 9 Feb 2022 21:23:04 -0500
X-Greylist: delayed 3600 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 09 Feb 2022 18:23:05 PST
Received: from srv23.r4in.tk (unknown [185.17.120.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19A1B22BC8
        for <linux-man@vger.kernel.org>; Wed,  9 Feb 2022 18:23:04 -0800 (PST)
Received: from [10.8.0.100] (helo=[192.168.72.154])
        by srv23.r4in.tk with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <hk@r4in.tk>)
        id 1nHxXz-00243U-PP; Thu, 10 Feb 2022 03:42:55 +0300
Message-ID: <2b9e5c94-fc1a-6ba3-20e5-3bb5c6430476@r4in.tk>
Date:   Thu, 10 Feb 2022 03:42:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
From:   hk <hk@r4in.tk>
Subject: man pthread_join(3)
To:     mtk.manpages@gmail.com, alx.manpages@gmail.com
Cc:     linux-man@vger.kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authenticated-Id: hk@r4in.tk
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Good day

I'm not sure that is a bug or I'm missing something, but still.

There is man-page for pthread_join() function and in its "ERRORS" section one
error code - EINVAL - is mentioned twice with different causes, so I have doubts
about how to handle such of an error.

Here is a link https://man7.org/linux/man-pages/man3/pthread_join.3.html

Could you correct that if it is a mistype? Or, may be add some kind of
explanation for that kind of situation.

-- 
with best regards,
Aitch Kay

GnuPG/DSA-ELG fingerprint:
C697 A07B DEE0 B000 2C3D 870D 9FBC 20C8 50ED 247F
