Return-Path: <SRS0=tPTA=33=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 825EBC352A2
	for <linux-man@archiver.kernel.org>; Fri,  7 Feb 2020 09:17:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4E5B020726
	for <linux-man@archiver.kernel.org>; Fri,  7 Feb 2020 09:17:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZtMhEOPs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726728AbgBGJRd (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Fri, 7 Feb 2020 04:17:33 -0500
Received: from mail-pf1-f182.google.com ([209.85.210.182]:33599 "EHLO
        mail-pf1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726674AbgBGJRc (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Fri, 7 Feb 2020 04:17:32 -0500
Received: by mail-pf1-f182.google.com with SMTP id n7so978281pfn.0
        for <linux-man@vger.kernel.org>; Fri, 07 Feb 2020 01:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=KjrVwS+ZYy2doTxL3AOQCgHHmyE1/kD+sSGizIuKVj8=;
        b=ZtMhEOPsRlJceChJvl03e3MLq6sRhNYGl/yE2QpzAGKvE5pitX3CuH1IyNSZl+K8Di
         q4tfcrVScuhw7FGKfrC4CWd/HUgeYyM2+nKpiw6n8d2QeAGqSSRZlcHAA/3U7VFmUBEa
         z33EB/dH2aIvqX4WWMBqYmSCBW4BCNQC48fPLtX3dmWiItrKlh19fRrvBcsh/Tdk4mjk
         eD9T+h/fYKqqOvcFF3eHcimCOiWTmkUOyQzjGRG2drIUeLY3mbQFhX1O+LnI7ZsLVqWa
         bAEReymHD/Q623lNeTL3VpnUKag2FgPge1yCELLHTGW7n9K9SV+RjBPfmTq5W5hmhUP9
         0lQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=KjrVwS+ZYy2doTxL3AOQCgHHmyE1/kD+sSGizIuKVj8=;
        b=I/ZKDpVvbBTS5tfWVRfCpKOvdt8foxOgzVc8P8ZFTIf7UJ/Y6yrmwkcBOBLFtUg2IV
         xHsFIJgFmRXd3ZRwcGetna/CZg8P31u/ODwfwODNXEAoxSsaytjpt8rcnWmt6XuNIUaq
         qRjexA9T7LwrTPJVafvnqfEJ11VV+C7myjYW7yH5q2l/1j7jEJSQngLEg9H0aOgBRyaq
         jQb8plodRdBDtC94KxUrYU8usxHk9OD8fXRp6EbwLoN6O5ulCWfrxBKRiXfroBQpOh04
         +ij43klaXr8Y1g5g9ADpAWUCBMAU/ovL9CfoeD3ICwakpT2FNRS87X/UPRmDTHT6lNRD
         3GtQ==
X-Gm-Message-State: APjAAAUnCJF9ISt+lAlIN5MRtTORf4fBxaPyzXPYGIYYXKiYtdvOK75e
        y8MVa6TzB3PQsVjOfddPArZ/07lu7uLbWifjPzOxzKY4EDE=
X-Google-Smtp-Source: APXvYqxRX4F+N8A8x+dth54iHShtEZubjWTLInea29YaPVyErWEpV99lj+gOus3d/ICo8BgcPVTOL1jDoJkNu75mnh8=
X-Received: by 2002:a63:691:: with SMTP id 139mr8921813pgg.325.1581067050676;
 Fri, 07 Feb 2020 01:17:30 -0800 (PST)
MIME-Version: 1.0
From:   Matthew Burgess <matthew.s.burgess@gmail.com>
Date:   Fri, 7 Feb 2020 09:17:19 +0000
Message-ID: <CAMOczyyvN5VK_gjfiM=Gpi2K3PcAx1vuWHrUwXvaTi+X9JUuRQ@mail.gmail.com>
Subject: Missing word 'be' in man page for 'find'
To:     mtk.manpages@gmail.com
Cc:     linux-man@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

At the start of the 'Global options' section in the man page for
'find', the third sentence of the first paragraph starts:

"To prevent confusion, global options should specified..."

But I think it should be:

"To prevent confusion, global options should be specified..."

This error is present in the version of the man page at
http://man7.org/linux/man-pages/man1/find.1.html
