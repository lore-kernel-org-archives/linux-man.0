Return-Path: <SRS0=LENQ=6D=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51622C3A5A9
	for <linux-man@archiver.kernel.org>; Sun, 19 Apr 2020 20:36:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 20CA62145D
	for <linux-man@archiver.kernel.org>; Sun, 19 Apr 2020 20:36:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LoAcA8N8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726362AbgDSUgg (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sun, 19 Apr 2020 16:36:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726341AbgDSUgf (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sun, 19 Apr 2020 16:36:35 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E96FC061A0C
        for <linux-man@vger.kernel.org>; Sun, 19 Apr 2020 13:36:35 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id k1so9656048wrx.4
        for <linux-man@vger.kernel.org>; Sun, 19 Apr 2020 13:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=cc:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=N2s1T9fNGhf6hiQNIeumBDK3Ya9iyNbUvwAjJ0tvX8k=;
        b=LoAcA8N83ggOVM/BjPl2wHDs4B+qj+Jd5RIThsPaK+BjpfJUltD8FSgM5+qUNY6sle
         fGbAlzEJdwIfpx6fDLvM6z/UFXbBK22DLuMuxaJQnUa75/TWr2Z3f/i4Ey1pG4m1QjhI
         zfOK9FLar96RXmv6kDAkYDa0UohHQjLl3kMXXPbYyhkWsfuepAh/be5iZAmfe6g8MAd2
         xxoRxuNUwr4y3RLxaDbGSaVq5jRRiUS3lA5mZtqCODA11krKkl2XnygyQEoqU2RgU+Pm
         gRJgWbZvGy9htWjxumHNUM17GxbzUyjYhF8t63SwYyJ4Ac/SE8n5JbdGSTjM2Hh37LmR
         bQlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:cc:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=N2s1T9fNGhf6hiQNIeumBDK3Ya9iyNbUvwAjJ0tvX8k=;
        b=E4VVEM5RbLg7YQ0m3cFQvT/bjcG490eE4OdGd2zPRmkFa3s/3QAy9UpcqHYy9NCR9A
         0S/Gj9XdZCzJ6h7cbzOoIjOAdJAq3UWsQc+gr0lMpOKR98BgikdqJEW2xyHzQS0kZnsa
         KxuBhYgBUUQZwV8w/AcwhUR2Txs8m4PkQiLXOCV0J1L3+NjiM33qLKgPyPQGxacDkzsT
         oiFOAkBMyTgLeDGr8oBmQ5HfsTIDcNJdECJvENvrtpwx5E/63kpATKU04YHc4xfh74RM
         LtAQPKDCZv73V2ol384NnGKldlMbIzhP7ttCQyoBaA9STIsvrYNOxDsB3ov6IrslhpUe
         09XA==
X-Gm-Message-State: AGi0PuazS+WMeS0Z14qcIea3sNWpG1IEEeJ/hqiJyiq6VM2csUDhxbAK
        uT4IlHEdRqN5QqGRn4/W/wtTJKiN
X-Google-Smtp-Source: APiQypIMbf6N+NJi6mNvZ8Vd1WZ318QYFvncQewf3HSNeh7JTUKJAeGZmS3ibdyq5HT/SM4OMfIUNw==
X-Received: by 2002:a5d:400f:: with SMTP id n15mr15088833wrp.344.1587328593669;
        Sun, 19 Apr 2020 13:36:33 -0700 (PDT)
Received: from [192.168.178.34] (aftr-62-216-206-150.dynamic.mnet-online.de. [62.216.206.150])
        by smtp.gmail.com with ESMTPSA id s12sm15226627wmc.7.2020.04.19.13.36.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Apr 2020 13:36:33 -0700 (PDT)
Cc:     mtk.manpages@gmail.com, linux-man@vger.kernel.org
Subject: Re: Errors in man pages, here: utmp(5): Missing closing bracket
To:     Helge Kreutzmann <debian@helgefjell.de>
References: <20200419064835.GA32586@Debian-50-lenny-64-minimal>
From:   "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Message-ID: <3d0b470e-91ba-6a2b-a2f8-d327ddf9d780@gmail.com>
Date:   Sun, 19 Apr 2020 22:36:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200419064835.GA32586@Debian-50-lenny-64-minimal>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

On 4/19/20 8:48 AM, Helge Kreutzmann wrote:
> Dear manpages maintainers.
> the manpage-l10n project maintains a large number of translations of
> man pages both from a large variety of sources (including manpages) as
> well for a large variety of target languages.
> 
> During their work translators notice different possible issues in the
> original (english) man pages. Sometiems this is a straightforward
> typo, sometimes a hard to read sentence, sometimes this is a convention
> not held up and sometimes we simply do not understand the original.
> 
> We use several distributions as sources and update regularly (at
> least every 2 month). This means we are fairly recent (some
> distributions like archlinux also update frequently) but might miss
> the latest upstream version once a while, so the error might be
> already fixed. We apologize and ask you to close the issue immediately
> if this should be the case, but given the huge volume of projects and
> the very limited number of volunteers we are not able to double check
> each and every issue.
> 
> Secondly we translators see the manpages in the neutral po format,
> i.e. converted and harmonized, but not the original source (be it man,
> groff, xml or other). So we cannot provide a true patch (where
> possible), but only an approximation which you need to translate into
> your source format.
> 
> Finally the issues I'm reporting have accumulated over time and are
> not always discovered by me, so sometimes my description of the
> problem my be a bit limited - do not hesitate to ask so we can clarify
> them.
> 
> I'm now reporting the errors for your project. As requested, each
> issue is sent in an unique mail for easier tracking on your side. If
> future reports should use another channel, please let me know.
> 
> **
> 
> Mining closing bracket at init(1), i.e. init (1 → init(1)


Fixed.

Thanks,

Michael

> "struct utmp {\n"
> "    short   ut_type;              /* Type of record */\n"
> "    pid_t   ut_pid;               /* PID of login process */\n"
> "    char    ut_line[UT_LINESIZE]; /* Device name of tty - \"/dev/\" */\n"
> "    char    ut_id[4];             /* Terminal name suffix,\n"
> "                                     or inittab(5) ID */\n"
> "    char    ut_user[UT_NAMESIZE]; /* Username */\n"
> "    char    ut_host[UT_HOSTSIZE]; /* Hostname for remote login, or\n"
> "                                     kernel version for run-level\n"
> "                                     messages */\n"
> "    struct  exit_status ut_exit;  /* Exit status of a process\n"
> "                                     marked as DEAD_PROCESS; not\n"
> "                                     used by Linux init (1 */\n"
> "    /* The ut_session and ut_tv fields must be the same size when\n"
> "       compiled 32- and 64-bit.  This allows data files and shared\n"
> "       memory to be shared between 32- and 64-bit applications. */\n"
> "#if __WORDSIZE == 64 && defined __WORDSIZE_COMPAT32\n"
> "    int32_t ut_session;           /* Session ID (B<getsid>(2)),\n"
> "                                     used for windowing */\n"
> "    struct {\n"
> "        int32_t tv_sec;           /* Seconds */\n"
> "        int32_t tv_usec;          /* Microseconds */\n"
> "    } ut_tv;                      /* Time entry was made */\n"
> "#else\n"
> "     long   ut_session;           /* Session ID */\n"
> "     struct timeval ut_tv;        /* Time entry was made */\n"
> "#endif\n"
> 
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
