Return-Path: <SRS0=TT+G=2R=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41639C2D0C6
	for <linux-man@archiver.kernel.org>; Fri, 27 Dec 2019 18:31:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 11B532053B
	for <linux-man@archiver.kernel.org>; Fri, 27 Dec 2019 18:31:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726495AbfL0SbE convert rfc822-to-8bit (ORCPT
        <rfc822;linux-man@archiver.kernel.org>);
        Fri, 27 Dec 2019 13:31:04 -0500
Received: from mail-qv1-f65.google.com ([209.85.219.65]:46594 "EHLO
        mail-qv1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726379AbfL0SbE (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Fri, 27 Dec 2019 13:31:04 -0500
Received: by mail-qv1-f65.google.com with SMTP id u1so9477805qvk.13
        for <linux-man@vger.kernel.org>; Fri, 27 Dec 2019 10:31:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=xh1x/yIgfj8oB2c9KFtRux9fZOLKyLns5uAfisJItgE=;
        b=oPhwv+gSpdekspJhl7cgGu9J9suNMA2lLxt0Qce3yH5vy7FVAvuH5UOIBB7cknYQ86
         uBP7bDy+jbXYw4L41suV9M7A1R/M6vHbjnxdDCR5U4DY7oCTcg6Uh7Kg9CqBT7xMMO6w
         8xjHO5dhJmsGz2yxR5IWAupZzZpZvbUFMYT181vqBUmG9DAaE9Ec8mnKZggNWLzRkvQd
         wOuydLeBcdIlKdZPyB4xiquKpjl9uVZTJfP2ZB7pKn9dcwsXrVbiXB3Pd/jEAqhU4Ozr
         q9WD8rWohqZNDZGTk0tgtLs+9sJOANGuRXhuciLL/12pXf77gdPBxFgcwKnrPso9tR1W
         mqZw==
X-Gm-Message-State: APjAAAWhsUGw4JpgS8bAuH2OpWQo916UZeTFokFyirNvSiy4x4tCtZ/a
        D/2t0np+c47zDqua4qtV+h0=
X-Google-Smtp-Source: APXvYqxeosMoqyIrpbAWc5YMShyUbj8emJxuDbocBvjKOFgleb64m4Vzyxy+okJwTMSK+2cG8s0z+g==
X-Received: by 2002:a05:6214:c3:: with SMTP id f3mr40677813qvs.226.1577471463369;
        Fri, 27 Dec 2019 10:31:03 -0800 (PST)
Received: from [10.0.1.13] ([66.92.75.42])
        by smtp.gmail.com with ESMTPSA id n190sm10023947qke.90.2019.12.27.10.31.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Dec 2019 10:31:02 -0800 (PST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 11.3 \(3445.6.18\))
Subject: Re: pic anomalies
From:   Federico Lucifredi <flucifredi@acm.org>
In-Reply-To: <201912271608.xBRG84Jr128687@tahoe.cs.Dartmouth.EDU>
Date:   Fri, 27 Dec 2019 13:31:00 -0500
Cc:     groff@gnu.org
Content-Transfer-Encoding: 8BIT
Message-Id: <CD458CB1-3C1D-42F5-B1BA-DAA604378D51@acm.org>
References: <201912271608.xBRG84Jr128687@tahoe.cs.Dartmouth.EDU>
To:     Doug McIlroy <doug@cs.dartmouth.edu>
X-Mailer: Apple Mail (2.3445.6.18)
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Hello Doug,
  for (1), I am CCing Michael Kerrisk — and the procedure to report issues on the man pages is tracked here https://www.kernel.org/doc/man-pages/reporting_bugs.html (In brief: email mtk.manpages@gmail.com and CC linux-man@vger.kernel.org).

   Best -Federico


> On Dec 27, 2019, at 11:08 AM, Doug McIlroy <doug@cs.dartmouth.edu> wrote:
> 
> The description of sprintf in the man page pic(1) does not
> reveal that only a few format codes are permitted.
> 
> Eric Raymond's "Making Pictures With GNU PIC" says only
> %,%e,%f,%g are  permitted. But what does a bare % mean?
> 
> In fact pic rejects a bare %. However it does accept
> %%, which is supposed to print a single %. Pic,
> however prints %%.
> 
> So I believe we have
> 1. An incompleteness in pic(1)
> 2. An error in "Making Pictures With GNU PIC"
> 3. An error in pic itself
> 
> Doug
> 

