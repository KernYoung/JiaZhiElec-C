package com.jiazhielec.system.service.impl;

import java.nio.charset.StandardCharsets;
import java.util.List;

import com.jiazhielec.common.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jiazhielec.system.domain.SysNotice;
import com.jiazhielec.system.mapper.SysNoticeMapper;
import com.jiazhielec.system.service.ISysNoticeService;

/**
 * 公告 服务层实现
 * 
 * @author ruoyi
 */
@Service
public class SysNoticeServiceImpl implements ISysNoticeService
{
    @Autowired
    private SysNoticeMapper noticeMapper;

    /**
     * 查询公告信息
     * 
     * @param noticeId 公告ID
     * @return 公告信息
     */
    @Override
    public SysNotice selectNoticeById(Long noticeId)
    {
        SysNotice sysNotice = noticeMapper.selectNoticeById(noticeId);
        if (sysNotice.getNoticeContentBit() != null && sysNotice.getNoticeContentBit().length > 0){
            String noticeContent = new String(sysNotice.getNoticeContentBit(), StandardCharsets.UTF_8);
            sysNotice.setNoticeContent(noticeContent);
        }
        return sysNotice;
    }

    /**
     * 查询公告列表
     * 
     * @param notice 公告信息
     * @return 公告集合
     */
    @Override
    public List<SysNotice> selectNoticeList(SysNotice notice)
    {
        List<SysNotice> sysNotices = noticeMapper.selectNoticeList(notice);
        if (sysNotices != null && !sysNotices.isEmpty()){
          for (SysNotice sysNotice : sysNotices) {
              if (sysNotice.getNoticeContentBit() != null && sysNotice.getNoticeContentBit().length > 0){
                  String noticeContent = new String(sysNotice.getNoticeContentBit(), StandardCharsets.UTF_8);
                  sysNotice.setNoticeContent(noticeContent);
              }
          }
        }
        return sysNotices;
    }

    /**
     * 新增公告
     * 
     * @param notice 公告信息
     * @return 结果
     */
    @Override
    public int insertNotice(SysNotice notice)
    {
        if (StringUtils.isNotBlank(notice.getNoticeContent())){
            notice.setNoticeContentBit(notice.getNoticeContent().getBytes(StandardCharsets.UTF_8));
        }
        return noticeMapper.insertNotice(notice);
    }

    /**
     * 修改公告
     * 
     * @param notice 公告信息
     * @return 结果
     */
    @Override
    public int updateNotice(SysNotice notice)
    {
        if (StringUtils.isNotBlank(notice.getNoticeContent())){
            notice.setNoticeContentBit(notice.getNoticeContent().getBytes(StandardCharsets.UTF_8));
        }
        return noticeMapper.updateNotice(notice);
    }

    /**
     * 删除公告对象
     * 
     * @param noticeId 公告ID
     * @return 结果
     */
    @Override
    public int deleteNoticeById(Long noticeId)
    {
        return noticeMapper.deleteNoticeById(noticeId);
    }

    /**
     * 批量删除公告信息
     * 
     * @param noticeIds 需要删除的公告ID
     * @return 结果
     */
    @Override
    public int deleteNoticeByIds(Long[] noticeIds)
    {
        return noticeMapper.deleteNoticeByIds(noticeIds);
    }
}
