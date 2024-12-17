### **项目详细设计**

本项目为基于 **Maven** 构建的 **JSP + Servlet + JDBC** 的新闻发布系统，整体设计围绕 **MVC 架构**，实现新闻展示、分类管理与搜索功能。以下是详细设计：

---

### **一、系统功能模块设计**

#### 1. **首页展示功能**
   - **页面**：`index.jsp`  
   - **核心功能**：
     - **头条新闻列表**：展示新闻标题、类别和发布日期。
     - **新闻类别列表**：在左侧导航栏展示所有新闻类别。
   - **实现逻辑**：
     - 使用 `NewsServlet` 获取所有新闻及类别数据。
     - 将数据通过 `request.setAttribute()` 传递给 `index.jsp`。
     - 页面通过 JSTL 或 EL 表达式展示新闻和类别数据。

---

#### 2. **新闻搜索功能**
   - **页面**：`search.jsp`，结果展示页面为 `searchResults.jsp`。  
   - **核心功能**：
     - 根据标题或新闻类别搜索新闻。
   - **实现逻辑**：
     - 前端搜索表单提交搜索关键词和搜索目标。
     - `SearchServlet` 接收请求，通过 `NewsDao.searchNews()` 执行 SQL 查询。
     - 将查询结果通过 `request.setAttribute()` 传递给结果页面 `searchResults.jsp`。

---

#### 3. **新闻详情功能**
   - **页面**：`info.jsp`  
   - **核心功能**：
     - 显示单条新闻的详细信息（标题、内容、发布时间等）。
   - **实现逻辑**：
     - 通过新闻 ID 查询具体新闻信息。
     - 在 `InfoServlet` 中实现对应查询方法，返回数据给 `info.jsp`。

---

### **二、数据库设计**

#### **1. 数据库表结构**

1. **`xinwenType`（新闻类别表）**
   | 字段名        | 类型         | 约束      | 说明           |
   |---------------|--------------|-----------|----------------|
   | `newsTypeId`  | INT          | 主键、自增 | 新闻类别ID     |
   | `newsTypeName`| VARCHAR(50)  | 非空      | 新闻类别名称   |

2. **`xinwen`（新闻表）**
   | 字段名           | 类型         | 约束        | 说明              |
   |------------------|--------------|-------------|-------------------|
   | `newsId`         | INT          | 主键、自增   | 新闻ID            |
   | `newsTitle`      | VARCHAR(255) | 非空        | 新闻标题          |
   | `newsTypeId`     | INT          | 外键        | 对应新闻类别ID    |
   | `newsPublishTime`| DATETIME     | 非空        | 发布时间          |

---

### **三、系统架构设计**

#### **MVC 架构**
- **Model（数据层）**：  
- 实体类：`NewsBean` 和 `NewsTypeBean`。  
- DAO 类：`NewsDao` 和 `NewsTypeDao`，封装数据库操作。  

- **View（视图层）**：  
- JSP 页面：`index.jsp`、`search.jsp` 和 `info.jsp`，展示新闻列表、搜索结果和详情。

- **Controller（控制器层）**：  
- Servlet 类：  
- **`NewsServlet`**：获取所有新闻和类别，转发到首页展示。  
- **`SearchServlet`**：处理搜索功能，返回搜索结果。  
- **`InfoServlet`**（待完善）：实现新闻详情显示。   

---

### **四、流程设计**

#### **1. 首页展示流程**
1. 用户访问 `index.jsp` 页面。  
2. `NewsServlet` 查询数据库，获取所有新闻和类别数据。  
3. 将数据传递给 JSP 页面进行渲染。  
4. 前端页面显示头条新闻和类别列表。

#### **2. 搜索功能流程**
1. 用户输入关键词和目标（标题/类别），提交搜索表单。  
2. `SearchServlet` 接收请求参数。  
3. 调用 `NewsDao.searchNews()` 方法，执行模糊查询。  
4. 查询结果传递给 `searchResults.jsp` 页面。  
5. 页面展示搜索结果。

#### **3. 新闻详情流程**
1. 用户点击新闻标题链接，跳转到 `info.jsp`。  
2. 通过新闻 ID 查询对应新闻信息。  
3. 数据返回给 `info.jsp` 页面，展示新闻详情内容。

---

### **五、系统界面设计**

1. **首页 `index.jsp`**  
   - 头条新闻区域：列表展示新闻标题、类别和发布日期。  
   - 左侧新闻类别区域：提供类别导航。  
   - 顶部搜索框：提供标题/类别搜索功能。

2. **搜索结果页面 `searchResults.jsp`**  
   - 根据关键词展示查询到的新闻列表。

3. **新闻详情页面 `info.jsp`**  
   - 展示新闻的具体内容，包括标题、作者、发布时间和正文。

---

### **六、技术实现**

1. **JDBC**：  
   - 连接 MySQL 数据库，执行 SQL 查询。  
   - 使用 `PreparedStatement` 避免 SQL 注入。  

2. **Servlet**：  
   - 处理 HTTP 请求，调用 DAO 获取数据并转发到 JSP 页面。  

3. **JSP**：  
   - 通过 JSTL 或 EL 表达式动态展示数据。  
   - 表单提交进行搜索操作。  

4. **前端页面**：  
   - HTML + CSS 实现页面布局。  
   - 简单的表单输入与样式美化。

---

### **总结**

该项目设计清晰，采用 MVC 架构分层开发，功能上实现新闻的展示、类别管理和搜索功能。数据库设计合理，能够支持后续功能扩展。整体架构适合中小型 Web 应用项目。