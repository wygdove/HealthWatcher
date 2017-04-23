package com.wygdove.hw.mybatis.model;

import java.util.ArrayList;
import java.util.List;

public class HwDeviceTypeExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public HwDeviceTypeExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andDeviceTypeIdIsNull() {
            addCriterion("device_type_id is null");
            return (Criteria) this;
        }

        public Criteria andDeviceTypeIdIsNotNull() {
            addCriterion("device_type_id is not null");
            return (Criteria) this;
        }

        public Criteria andDeviceTypeIdEqualTo(Integer value) {
            addCriterion("device_type_id =", value, "deviceTypeId");
            return (Criteria) this;
        }

        public Criteria andDeviceTypeIdNotEqualTo(Integer value) {
            addCriterion("device_type_id <>", value, "deviceTypeId");
            return (Criteria) this;
        }

        public Criteria andDeviceTypeIdGreaterThan(Integer value) {
            addCriterion("device_type_id >", value, "deviceTypeId");
            return (Criteria) this;
        }

        public Criteria andDeviceTypeIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("device_type_id >=", value, "deviceTypeId");
            return (Criteria) this;
        }

        public Criteria andDeviceTypeIdLessThan(Integer value) {
            addCriterion("device_type_id <", value, "deviceTypeId");
            return (Criteria) this;
        }

        public Criteria andDeviceTypeIdLessThanOrEqualTo(Integer value) {
            addCriterion("device_type_id <=", value, "deviceTypeId");
            return (Criteria) this;
        }

        public Criteria andDeviceTypeIdIn(List<Integer> values) {
            addCriterion("device_type_id in", values, "deviceTypeId");
            return (Criteria) this;
        }

        public Criteria andDeviceTypeIdNotIn(List<Integer> values) {
            addCriterion("device_type_id not in", values, "deviceTypeId");
            return (Criteria) this;
        }

        public Criteria andDeviceTypeIdBetween(Integer value1, Integer value2) {
            addCriterion("device_type_id between", value1, value2, "deviceTypeId");
            return (Criteria) this;
        }

        public Criteria andDeviceTypeIdNotBetween(Integer value1, Integer value2) {
            addCriterion("device_type_id not between", value1, value2, "deviceTypeId");
            return (Criteria) this;
        }

        public Criteria andDeviceTypeIsNull() {
            addCriterion("device_type is null");
            return (Criteria) this;
        }

        public Criteria andDeviceTypeIsNotNull() {
            addCriterion("device_type is not null");
            return (Criteria) this;
        }

        public Criteria andDeviceTypeEqualTo(String value) {
            addCriterion("device_type =", value, "deviceType");
            return (Criteria) this;
        }

        public Criteria andDeviceTypeNotEqualTo(String value) {
            addCriterion("device_type <>", value, "deviceType");
            return (Criteria) this;
        }

        public Criteria andDeviceTypeGreaterThan(String value) {
            addCriterion("device_type >", value, "deviceType");
            return (Criteria) this;
        }

        public Criteria andDeviceTypeGreaterThanOrEqualTo(String value) {
            addCriterion("device_type >=", value, "deviceType");
            return (Criteria) this;
        }

        public Criteria andDeviceTypeLessThan(String value) {
            addCriterion("device_type <", value, "deviceType");
            return (Criteria) this;
        }

        public Criteria andDeviceTypeLessThanOrEqualTo(String value) {
            addCriterion("device_type <=", value, "deviceType");
            return (Criteria) this;
        }

        public Criteria andDeviceTypeLike(String value) {
            addCriterion("device_type like", value, "deviceType");
            return (Criteria) this;
        }

        public Criteria andDeviceTypeNotLike(String value) {
            addCriterion("device_type not like", value, "deviceType");
            return (Criteria) this;
        }

        public Criteria andDeviceTypeIn(List<String> values) {
            addCriterion("device_type in", values, "deviceType");
            return (Criteria) this;
        }

        public Criteria andDeviceTypeNotIn(List<String> values) {
            addCriterion("device_type not in", values, "deviceType");
            return (Criteria) this;
        }

        public Criteria andDeviceTypeBetween(String value1, String value2) {
            addCriterion("device_type between", value1, value2, "deviceType");
            return (Criteria) this;
        }

        public Criteria andDeviceTypeNotBetween(String value1, String value2) {
            addCriterion("device_type not between", value1, value2, "deviceType");
            return (Criteria) this;
        }

        public Criteria andDeviceTypeDescriptionIsNull() {
            addCriterion("device_type_description is null");
            return (Criteria) this;
        }

        public Criteria andDeviceTypeDescriptionIsNotNull() {
            addCriterion("device_type_description is not null");
            return (Criteria) this;
        }

        public Criteria andDeviceTypeDescriptionEqualTo(String value) {
            addCriterion("device_type_description =", value, "deviceTypeDescription");
            return (Criteria) this;
        }

        public Criteria andDeviceTypeDescriptionNotEqualTo(String value) {
            addCriterion("device_type_description <>", value, "deviceTypeDescription");
            return (Criteria) this;
        }

        public Criteria andDeviceTypeDescriptionGreaterThan(String value) {
            addCriterion("device_type_description >", value, "deviceTypeDescription");
            return (Criteria) this;
        }

        public Criteria andDeviceTypeDescriptionGreaterThanOrEqualTo(String value) {
            addCriterion("device_type_description >=", value, "deviceTypeDescription");
            return (Criteria) this;
        }

        public Criteria andDeviceTypeDescriptionLessThan(String value) {
            addCriterion("device_type_description <", value, "deviceTypeDescription");
            return (Criteria) this;
        }

        public Criteria andDeviceTypeDescriptionLessThanOrEqualTo(String value) {
            addCriterion("device_type_description <=", value, "deviceTypeDescription");
            return (Criteria) this;
        }

        public Criteria andDeviceTypeDescriptionLike(String value) {
            addCriterion("device_type_description like", value, "deviceTypeDescription");
            return (Criteria) this;
        }

        public Criteria andDeviceTypeDescriptionNotLike(String value) {
            addCriterion("device_type_description not like", value, "deviceTypeDescription");
            return (Criteria) this;
        }

        public Criteria andDeviceTypeDescriptionIn(List<String> values) {
            addCriterion("device_type_description in", values, "deviceTypeDescription");
            return (Criteria) this;
        }

        public Criteria andDeviceTypeDescriptionNotIn(List<String> values) {
            addCriterion("device_type_description not in", values, "deviceTypeDescription");
            return (Criteria) this;
        }

        public Criteria andDeviceTypeDescriptionBetween(String value1, String value2) {
            addCriterion("device_type_description between", value1, value2, "deviceTypeDescription");
            return (Criteria) this;
        }

        public Criteria andDeviceTypeDescriptionNotBetween(String value1, String value2) {
            addCriterion("device_type_description not between", value1, value2, "deviceTypeDescription");
            return (Criteria) this;
        }

        public Criteria andIsvalidIsNull() {
            addCriterion("isvalid is null");
            return (Criteria) this;
        }

        public Criteria andIsvalidIsNotNull() {
            addCriterion("isvalid is not null");
            return (Criteria) this;
        }

        public Criteria andIsvalidEqualTo(Boolean value) {
            addCriterion("isvalid =", value, "isvalid");
            return (Criteria) this;
        }

        public Criteria andIsvalidNotEqualTo(Boolean value) {
            addCriterion("isvalid <>", value, "isvalid");
            return (Criteria) this;
        }

        public Criteria andIsvalidGreaterThan(Boolean value) {
            addCriterion("isvalid >", value, "isvalid");
            return (Criteria) this;
        }

        public Criteria andIsvalidGreaterThanOrEqualTo(Boolean value) {
            addCriterion("isvalid >=", value, "isvalid");
            return (Criteria) this;
        }

        public Criteria andIsvalidLessThan(Boolean value) {
            addCriterion("isvalid <", value, "isvalid");
            return (Criteria) this;
        }

        public Criteria andIsvalidLessThanOrEqualTo(Boolean value) {
            addCriterion("isvalid <=", value, "isvalid");
            return (Criteria) this;
        }

        public Criteria andIsvalidIn(List<Boolean> values) {
            addCriterion("isvalid in", values, "isvalid");
            return (Criteria) this;
        }

        public Criteria andIsvalidNotIn(List<Boolean> values) {
            addCriterion("isvalid not in", values, "isvalid");
            return (Criteria) this;
        }

        public Criteria andIsvalidBetween(Boolean value1, Boolean value2) {
            addCriterion("isvalid between", value1, value2, "isvalid");
            return (Criteria) this;
        }

        public Criteria andIsvalidNotBetween(Boolean value1, Boolean value2) {
            addCriterion("isvalid not between", value1, value2, "isvalid");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}