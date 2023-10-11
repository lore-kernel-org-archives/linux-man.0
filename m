Return-Path: <linux-man-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2992CD6E5A
	for <linux-man@archiver.kernel.org>; Wed, 11 Oct 2023 11:12:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231264AbjJKLMj (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Wed, 11 Oct 2023 07:12:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231703AbjJKLMi (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Wed, 11 Oct 2023 07:12:38 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85E929D
        for <linux-man@vger.kernel.org>; Wed, 11 Oct 2023 04:12:36 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-578d791dd91so681702a12.0
        for <linux-man@vger.kernel.org>; Wed, 11 Oct 2023 04:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1697022756; x=1697627556; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gjsAmq+UDtRcwsqa7pwWOlDlSi9ktp9RrKIka5FTGtY=;
        b=kNizdG6cghWrNBHAcBk2Uf2MaEA1KQE2JgxFUbJ/0oK23xLtxR+I57jxl9iGX4lnT2
         Ciihy5+ZfdOiekubr1lTdR1AHOkXeAKKYCEBX/EJDIhRwo0QccnY0nJeg8GFjHDIAr+o
         FOppwqttao3DTG9z9VGFOYRXxvIG9wFgKgvnc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697022756; x=1697627556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gjsAmq+UDtRcwsqa7pwWOlDlSi9ktp9RrKIka5FTGtY=;
        b=M7DsVulQujsj3N1SRapG/zxWttjXycf6Zx11UGqVQoU0WnfeYp8ZuldZC4BKT3NjuO
         G/3WKDKzUW4gvfahSAWh5Q4zoh2RRkWNtUbvyHwKH/TJZ06LYGDdFw92pt5wYuFim6n9
         xtJs2bWGlN86y2poL5YSaCGt6gqIUd2861TNpT/K8Ouan4XKRMwAUvX6lxNshFK/zJLL
         psWFcYYr9DF+4kqB3IXmWwPH0ERN7g4oOF+4EeTs4VSfNEMj7p6dkX2nUWnVuXDM8/Vu
         CMYSiqtHNnXB598NTiwEyp/u95BuwMIP5vliSme2xvjqK6ZFTd3LNbZ67dy7cRDoBH53
         CLwQ==
X-Gm-Message-State: AOJu0YzmnN6BOAyP9h+HOVMc1zFThcBeVf33/EsvtlAmxBnAWqTQZUiO
        0N5Yiufpv+AVEqi2Y1ro5AJ87A9T0wAExcRQQ2Sx3w==
X-Google-Smtp-Source: AGHT+IFTbjSfYEVtUtxEZJ0rZpV5Ew8ABQgP4uqhGZsKOSRlBIJEGd2JcacrgTnwISqikFvDpWwP0mITq/oMEBR45xg=
X-Received: by 2002:a17:90b:1c0f:b0:261:2824:6b8c with SMTP id
 oc15-20020a17090b1c0f00b0026128246b8cmr26103189pjb.13.1697022755929; Wed, 11
 Oct 2023 04:12:35 -0700 (PDT)
MIME-Version: 1.0
References: <20231003155010.3651349-1-revest@chromium.org> <ZSQrmNWtNEiIj7bl@arm.com>
In-Reply-To: <ZSQrmNWtNEiIj7bl@arm.com>
From:   Florent Revest <revest@chromium.org>
Date:   Wed, 11 Oct 2023 13:12:24 +0200
Message-ID: <CABRcYmL3xt7gUoeOcmprmTfvDmMiyQCSf_dDqdi2GcjhAVquFg@mail.gmail.com>
Subject: Re: [PATCH] prctl.2: Document PR_SET_MDWE and PR_GET_MDWE
To:     Catalin Marinas <catalin.marinas@arm.com>
Cc:     alx@kernel.org, linux-man@vger.kernel.org, joey.gouly@arm.com,
        akpm@linux-foundation.org, keescook@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

On Mon, Oct 9, 2023 at 6:34=E2=80=AFPM Catalin Marinas <catalin.marinas@arm=
.com> wrote:
>
> On Tue, Oct 03, 2023 at 05:50:10PM +0200, Florent Revest wrote:
> > +.B PR_MDWE_REFUSE_EXEC_GAIN
> > +New memory mapping protections can't be writable and executable. Non-e=
xecutable
> > +mappings can't become executable.
> > +.TP
> > +.B PR_MDWE_NO_INHERIT " (since Linux 6.6)"
> > +.\" commit 2a87e5520554034e8c423479740f95bea4a086a0
> > +Do not propagate MDWE protection to child processes on
>
> Should this mention that PR_MDWE_NO_INHERIT requires
> PR_MDWE_REFUSE_EXEC_GAIN (unless I forgot how this was supposed to
> work).

Yes! :) That's a good point, thank you Catalin
